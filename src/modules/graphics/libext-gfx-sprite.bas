''Copyright (c) 2007-2011, FreeBASIC Extended Library Development Group
''
''All rights reserved.
''
''Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
''
''    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
''    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
''    * Neither the name of the FreeBASIC Extended Library Development Group nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
''
''THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
''"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
''LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
''A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
''CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
''EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
''PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
''PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
''LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
''NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
''SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#include once "ext/graphics/sprite.bi"
#include once "ext/graphics/manip.bi"
#include once "ext/graphics/collision.bi"
#include once "ext/debug.bi"

fbext_instanciate(vector2, ((single)))

namespace ext.gfx

'' :::::
static function Sprite.Masker ( byval src_color as uinteger, byval dest_color as uinteger, byval xx as any ptr ) as uinteger

	if (src_color AND &h00ffffff) = &hff00ff then return 0

	return &hFFFFFF

end function

'' :::::
static function Sprite.CMasker ( byval src_color as uinteger, byval dest_color as uinteger, byval xx as any ptr ) as uinteger

	if src_color = &hffFFff and dest_color = &hffFFff then return &hFF0000

	return dest_color

end function

'' :::::
constructor Sprite ( byval num as uinteger)

	m_size = num
	m_imgdata = callocate(sizeof(FB.IMAGE ptr) * m_size)
	m_coldata = callocate(sizeof(FB.IMAGE ptr) * m_size)
	m_lastindex = 0

end constructor

'' :::::
constructor Sprite ( )

	m_size = 0
	m_lastindex = 0

end constructor

'' :::::
constructor Sprite( byref rhs as Sprite )

	m_size = rhs.m_size
	m_imgdata = callocate(sizeof(FB.IMAGE ptr) * m_size)
	m_coldata = callocate(sizeof(FB.IMAGE ptr) * m_size)
	
	for n as uinteger = 0 to m_size -1
	
		if rhs.m_imgdata[n] <> null then
			m_imgdata[n] = imagecreate( rhs.m_imgdata[n]->width, rhs.m_imgdata[n]->height )
			put m_imgdata[n], (0,0), rhs.m_imgdata[n], PSET
		end if
		
		if rhs.m_coldata[n] <> null then
			m_coldata[n] = imagecreate( rhs.m_coldata[n]->width, rhs.m_coldata[n]->height )
			put m_coldata[n], (0,0), rhs.m_coldata[n], PSET
		end if
	
	next n
	
	m_lastindex = rhs.m_lastindex

end constructor
'' :::::
destructor Sprite ( )
	if m_size > 0 then
	for n as uinteger = 0 to m_size - 1

		if m_imgdata[n] <> null then imagedestroy(m_imgdata[n])
		if m_coldata[n] <> null then imagedestroy(m_coldata[n])
	next
	end if
	if m_imgdata <> null then deallocate m_imgdata
	if m_coldata <> null then deallocate m_coldata
	
end destructor

'' :::::
function Sprite.FromSpritesheet( byval srci as fb.image ptr, byval startx as uinteger, byval starty as uinteger, _
        byval spwidth as uinteger, byval spheight as uinteger, byval startindex as uinteger, byval numsp as integer ) _
        as integer
		
		if numsp * spwidth > srci->width then return -1

		if numsp > m_size then return 0

        var stepr = startindex

        for n as uinteger = startx to startx + (spwidth * numsp) step spwidth

                var newimg = imagecreate( spwidth, spheight )
				
                get srci, (n,starty)-(n+(spwidth-1),starty+(spheight-1)), newimg
				
				SetImage(stepr, newimg)

                stepr += 1

        next n

        return stepr - startindex
		
end function

'' :::::
function Sprite.GetImage( byval index as uinteger ) as FB.IMAGE ptr

	if (index + 1) <= m_size then
		m_lastindex = index
		return m_imgdata[m_lastindex]

	else
		return ext.null

	end if

end function

sub Sprite.Position overload( byref _x_ as single, byref _y_ as single )

	if _x_ < 0 or _y_ < 0 then
		_x_ = m_vec.x
		_y_ = m_vec.y
		return
	end if
	
	m_vec = ext.math.vec2f(_x_,_y_)
	
end sub

sub Sprite.Position ( byref _vec_ as ext.math.vec2f )

	if _vec_.x < 0 or _vec_.y < 0 then
		_vec_ = m_vec
		return
	end if
	
	m_vec = _vec_	

end sub
	
sub Sprite.Update ( byval _x_diff as single = 0, byref _y_diff as single = 0 )

	Update( ext.math.vec2f(_x_diff, _y_diff) )

end sub

sub Sprite.Update ( byval _vec_ as ext.math.vec2f )

	m_vec = m_vec + _vec_

end sub

'' :::::
sub Sprite.DrawImage ( _
		byval src_img as uinteger, _
		byval dst_img as FB.IMAGE ptr, _
		byval method as DrawMethods _
)

	if ((src_img +1) <= m_size) then

		var x_location = m_vec.x
		var y_location = m_vec.y
	
		m_lastindex = src_img


		select case method

		case DrawMethods.PSET_
			put dst_img, (x_location, y_location), m_imgdata[src_img], PSET

		case DrawMethods.PRESET_
			put dst_img, (x_location, y_location), m_imgdata[src_img], PRESET

		case DrawMethods.TRANS_
			put dst_img, (x_location, y_location), m_imgdata[src_img], TRANS

		case DrawMethods.AND_
			put dst_img, (x_location, y_location), m_imgdata[src_img], AND

		case DrawMethods.OR_
			put dst_img, (x_location, y_location), m_imgdata[src_img], OR

		case DrawMethods.XOR_
			put dst_img, (x_location, y_location), m_imgdata[src_img], XOR

		case DrawMethods.ALPHA_
			put dst_img, (x_location, y_location), m_imgdata[src_img], ALPHA

		end select

	end if

end sub

'' :::::
sub Sprite.RotateFrom ( byval from_index as uinteger, byval to_index as uinteger, byval angle as integer )

	if ((from_index +1) <= m_size) AND ((to_index + 1) <= m_size) then

		if m_imgdata[to_index] <> null then imagedestroy( m_imgdata[to_index] )

		m_imgdata[to_index] = imagecreate(m_imgdata[from_index]->width, m_imgdata[from_index]->height, &hff00ff)

		ext.gfx.Rotate( m_imgdata[to_index], m_imgdata[from_index], 0, 0, angle )

		this.UpdateImage( to_index )

	end if

end sub


'' :::::
sub Sprite.RotateFromImage ( byval from_image as FB.IMAGE ptr, byval to_index as uinteger, byval angle as integer )

	if ((to_index + 1) <= m_size) AND from_image <> null then

		if m_imgdata[to_index] <> null then imagedestroy( m_imgdata[to_index] )

		m_imgdata[to_index] = imagecreate(from_image->width, from_image->height, &hff00ff)

		ext.gfx.Rotate( m_imgdata[to_index], from_image, 0, 0, angle )

		this.UpdateImage( to_index )

	end if

end sub

'' :::::
sub Sprite.Init ( byval num as uinteger )

	if m_size = 0 then
	
		m_size = num
		m_imgdata = callocate(sizeof(FB.IMAGE ptr) * m_size)
		m_coldata = callocate(sizeof(FB.IMAGE ptr) * m_size)
		m_lastindex = 0
		
	end if

end sub

'' :::::
function Sprite.GetColMap ( byval index as uinteger ) as FB.IMAGE ptr

	return m_coldata[index]

end function

'' :::::
sub Sprite.ReplaceImage ( byval index as uinteger, byval img as FB.IMAGE ptr )

	if index <= m_size-1 then

	if m_imgdata[index] = ext.null then

		m_imgdata[index] = img

	else
		imagedestroy m_imgdata[index]
		m_imgdata[index] = img

	end if

	UpdateImage(index)

	end if

end sub

'' :::::
sub Sprite.DuplicateImage ( byval from_index as uinteger, byval to_index as uinteger )

	if (from_index <= m_size-1) and (to_index <= m_size-1) and (from_index <> to_index) then

		var temp = imagecreate( m_imgdata[from_index]->width, m_imgdata[from_index]->height )
		put temp, (0,0), m_imgdata[from_index], PSET

		ReplaceImage(to_index, temp)

	end if

end sub

'' :::::
sub Sprite.DeleteImage ( byval index as uinteger )

	if m_imgdata[index] <> ext.null then
		imagedestroy m_imgdata[index]

	end if

end sub

'' :::::
sub Sprite.SetImage ( byval index as uinteger, byval img as FB.IMAGE ptr )

	m_lastindex = index
	m_imgdata[m_lastindex] = img

	m_coldata[m_lastindex] = imagecreate(img->width, img->height, &hFF00FF)

	put m_coldata[m_lastindex], (0,0), m_imgdata[m_lastindex], CUSTOM, @Masker

end sub

'' :::::
sub Sprite.UpdateImage ( byval index as uinteger )

	if m_coldata[index] <> ext.null then
		imagedestroy m_coldata[index]

	end if

	m_coldata[index] = imagecreate(m_imgdata[index]->width, m_imgdata[index]->height, &hFF00FF)

	put m_coldata[index], (0,0), m_imgdata[index], CUSTOM, @Masker

end sub

'' :::::
function Sprite.isCollided ( byref spr as Sprite, byval ppcol as PPOPTIONS = usePP, byval _index_ as integer = -1 ) as ext.bool

	static as uinteger useIndex = 0

	if _index_ = -1 then useIndex = spr.LastIndex

	var x1 = m_vec.x : var y1 = m_vec.y
	var x2 = spr.m_vec.x : var y2 = spr.m_vec.y
	
	if ext.gfx.collision_rect(m_imgdata[m_lastindex], x1, y1, spr.GetImage(useIndex), x2, y2) then

		if (ppcol = noPP) then return ext.bool.true

		m_temp = imagecreate(m_coldata[m_lastindex]->width, m_coldata[m_lastindex]->height)
		put m_temp, (0,0), m_coldata[m_lastindex], PSET

		var cx = x2 - x1
		var cy = y2 - y1

		put m_temp, (cx,cy), spr.GetColMap(useIndex), CUSTOM, @CMasker

		var pp = cast(uinteger ptr, m_temp + 1)
		for n as uinteger = 0 to (m_temp->height * m_temp->width) - 1
			if pp[n] = &hFF0000 then return ext.bool.true
		next
		imagedestroy m_temp

	end if

	return ext.bool.false

end function

'' :::::
property Sprite.LastIndex ( ) as uinteger

	return m_lastindex

end property

'' :::::
property Sprite.Count ( ) as uinteger

	return m_size

end property

end namespace
