note
	description: "[
				Represent TEXT, CDATA, COMMENT, and WHITESPACE elements.
 				This contains just a block of text and its position.
 				]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GP_TEXT

create
	make_by_pointer

feature {NONE} --Implementation

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

	text: detachable READABLE_STRING_GENERAL
			-- The text of this node
		local
			l_pointer: POINTER
			l_cstring: C_STRING
		do
			l_pointer := c_text (item)
			if l_pointer /= default_pointer then
				create l_cstring.make_by_pointer (l_pointer)
				Result := l_cstring.string
			end
		end

	original_text: detachable GP_STRING_PIECE
			-- The original text of this node
		local
			l_pointer: POINTER
		do
			l_pointer := c_original_text (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	start_pos: detachable GP_SOURCE_POSITION
			-- The starting position of this node
		local
			l_pointer: POINTER
		do
			l_pointer := c_start_pos (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

feature {NONE} -- C Externals

	c_text (p: POINTER): POINTER
				-- The text of this node, after entities have been parsed and decoded.  For
				-- comment/cdata nodes, this does not include the comment delimiters.
				-- const char* text;
		require
			p_is_not_null: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"return (const char*) ((GumboText *)$p)-> text;"
		end


	c_original_text (p: POINTER): POINTER
				-- The original text of this node, as a pointer into the original buffer.  For
				-- comment/cdata nodes, this includes the comment delimiters.
				-- GumboStringPiece original_text;
		require
			p_is_not_null: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"return &(((GumboText *)$p)-> original_text);"
		end


	c_start_pos (p: POINTER): POINTER
				-- The starting position of this node.  This corresponds to the position of
				-- original_text, before entities are decoded.
				-- GumboSourcePosition start_pos;
		require
			p_is_not_null: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"return &(((GumboText *)$p)-> start_pos);"
		end

end
