note
	description: "[
					 Representing a string or part of a string.  Strings within the
					 parser are represented by a char* and a length; the char* points into
					 an existing data buffer owned by some other code (often the original input).
					 GumboStringPieces are assumed (by convention) to be immutable, because they
					 may share data.  Use GumboStringBuffer if you need to construct a string.
					 Clients should assume that it is not NUL-terminated, and should always use
					 explicit lengths when manipulating them.
		
			]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GP_SOURCE_POSITION

create
	make_by_pointer

feature {NONE} -- Initialization

	make_by_pointer (a_pointer: POINTER)
		require
			a_pointer_not_null: a_pointer /= default_pointer
		do
			item := a_pointer
		ensure
			item_set: item = a_pointer
		end

feature -- Access

	item: POINTER
		-- Access memory area

	line: NATURAL
		do
			Result := c_line (item)
		end

	colum: NATURAL
		do
			Result := c_column (item)
		end

	offset: NATURAL
		do
			Result := c_offset (item)
		end

feature {NONE} -- Implementation

	c_line (p: POINTER): NATURAL
		require
			p_not_void: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"return ((GumboSourcePosition *) $p)->line;"
		end

	c_column (p: POINTER): NATURAL
		require
			p_not_void: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"return ((GumboSourcePosition *) $p)->column;"
		end

	c_offset (p: POINTER): NATURAL
		require
			p_not_void: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"return ((GumboSourcePosition *) $p)->offset;"
		end

end
