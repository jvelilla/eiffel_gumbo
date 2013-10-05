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
	GP_STRING_PIECE

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

	data: detachable READABLE_STRING_GENERAL
			-- the string fragment
		local
			l_string : C_STRING
			l_pointer: POINTER
		do
			l_pointer := c_data (item)
			if l_pointer /= default_pointer then
				create l_string.make_by_pointer (l_pointer)
				Result := l_string.string
			end
		end

	length: NATURAL
			-- length of the string fragment
		do
			Result := c_length (item)
		end

feature -- Status Report		

	string_equals (other: GP_STRING_PIECE): BOOLEAN
			-- Compares two GumboStringPieces, and returns true if they're equal or false
			-- otherwise.
			-- bool gumbo_string_equals(
			--    const GumboStringPiece* str1, const GumboStringPiece* str2);
		do
			Result := c_gumbo_string_equals (Current.item, other.item)
		end

	string_equals_ignore_case (other: GP_STRING_PIECE): BOOLEAN
			-- Compares two GumboStringPieces ignoring case, and returns true if they're
			-- equal or false otherwise.
			--
			-- bool gumbo_string_equals_ignore_case(
			--    const GumboStringPiece* str1, const GumboStringPiece* str2);
		do
			Result := c_gumbo_string_equals_ignore_case (Current.item, other.item)
		end


feature {NONE} -- Implementation		

	c_data (p: POINTER): POINTER
		require p_not_null: p /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return ((GumboStringPiece *) $p)->data;"
    	end

    c_length (p: POINTER): NATURAL
    	require p_not_null: p /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return (size_t)((GumboStringPiece *) $p)->length;"
    	end


   c_gumbo_string_equals (a_str1: POINTER; a_str2: POINTER): BOOLEAN
   		require a_str1_not_null: a_str1 /= default_pointer
   				a_str2_not_null: a_str2 /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return gumbo_string_equals( (const GumboStringPiece*)$a_str1, (const GumboStringPiece*)$a_str2);"
    	end

   c_gumbo_string_equals_ignore_case (a_str1: POINTER; a_str2: POINTER): BOOLEAN
   		require a_str1_not_null: a_str1 /= default_pointer
   				a_str2_not_null: a_str2 /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return gumbo_string_equals_ignore_case((const GumboStringPiece*)$a_str1, (const GumboStringPiece*)$a_str2);"
    	end

    c_gumbo_tag_from_original_text (a_text: POINTER)
			-- Extracts the tag name from the original_text field of an element or token by
			-- stripping off </> characters and attributes and adjusting the passed-in
			-- GumboStringPiece appropriately.  The tag name is in the original case and
			-- shares a buffer with the original text, to simplify memory management.
			-- Behavior is undefined if a string-piece that doesn't represent an HTML tag
			-- (<tagname> or </tagname>) is passed in.  If the string piece is completely
			-- empty (NULL data pointer), then this function will exit successfully as a
			-- no-op.
    	require
    		a_text_not_null: a_text /= default_pointer
    	external
    		"C inline use <gumbo.h>"
    	alias
    		"gumbo_tag_from_original_text((GumboStringPiece*)$a_text)"
    	end


	c_gumbo_normalize_svg_tagname (a_tagname: POINTER): POINTER
			-- Fixes the case of SVG elements that are not all lowercase.
			-- http://www.whatwg.org/specs/web-apps/current-work/multipage/tree-construction.html#parsing-main-inforeign
			-- This is not done at parse time because there's no place to store a mutated
			-- tag name.  tag_name is an enum (which will be TAG_UNKNOWN for most SVG tags
			-- without special handling), while original_tag_name is a pointer into the
			-- original buffer.  Instead, we provide this helper function that clients can
			-- use to rename SVG tags as appropriate.
			-- Returns the case-normalized SVG tagname if a replacement is found, or NULL if
			-- no normalization is called for.  The return value is static data and owned by
			-- the library.
		require
			a_tagname_not_null: a_tagname /= default_pointer
		external
			"c inline use <gumbo.h>"
		alias
			"return  (const char*) gumbo_normalize_svg_tagname((const GumboStringPiece*)$a_tagname);"
		end


end
