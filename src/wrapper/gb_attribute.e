note
	description: "[
					Represent a single attribute on an HTML tag.  This is a
 					name-value pair, but also includes information about source locations and
 					original source text.
 					]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GB_ATTRIBUTE


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
		-- Access memory data


	namespace: GP_ATTRIBUTE_NAMESPACE
			-- The namespace for the attribute
		do
			create Result.make_by_value (c_attr_namespace (item))
		end

	name: detachable READABLE_STRING_GENERAL
			-- The name of the attribute
		local
			l_pointer: POINTER
			l_cstring: C_STRING
		do
			l_pointer := c_name (item)
			if l_pointer /= default_pointer then
				create l_cstring.make_by_pointer (l_pointer)
				Result := l_cstring.string
			end
		end

	original_name: detachable GP_STRING_PIECE
			-- The original text of the attribute name
		local
			l_pointer: POINTER
		do
			l_pointer := c_original_name (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	value: detachable READABLE_STRING_GENERAL
			-- The value of the attribute.		
		local
			l_pointer: POINTER
			l_cstring: C_STRING
		do
			l_pointer := c_value (item)
			if l_pointer /= default_pointer then
				create l_cstring.make_by_pointer (l_pointer)
				Result := l_cstring.string
			end
		end


	name_start: detachable GP_SOURCE_POSITION
			-- The starting position of the attribute name.
		local
			l_pointer: POINTER
		do
			l_pointer := c_name_start (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	name_end: detachable GP_SOURCE_POSITION
			-- The ending position of the attribute name.
		local
			l_pointer: POINTER
		do
			l_pointer := c_name_end (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end


	value_start: detachable GP_SOURCE_POSITION
			-- The starting position of the attribute value.
		local
			l_pointer: POINTER
		do
			l_pointer := c_value_start (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	value_end: detachable GP_SOURCE_POSITION
			-- The ending position of the attribute value.
		local
			l_pointer: POINTER
		do
			l_pointer := c_value_end (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end


feature {NONE} -- C external


	c_attr_namespace (p: POINTER): INTEGER
			-- The namespace for the attribute.  This will usually be
			-- GUMBO_ATTR_NAMESPACE_NONE, but some XLink/XMLNS/XML attributes take special
			-- values, per:
			-- http://www.whatwg.org/specs/web-apps/current-work/multipage/tree-construction.html#adjust-foreign-attributes

			-- GumboAttributeNamespaceEnum attr_namespace;
		external
			"c inline use <gumbo.h>"
		alias
			"return ((GumboAttribute *) $p)->attr_namespace;"
		end

	c_name (p: POINTER): POINTER
			-- The name of the attribute.  This is in a freshly-allocated buffer to deal
			-- with case-normalization, and is null-terminated.

			-- const char* name;
		external
			"c inline use <gumbo.h>"
		alias
			"return ((GumboAttribute *) $p)->name;"
		end


	c_original_name (p: POINTER): POINTER
			--The original text of the attribute name, as a pointer into the original
			--source buffer.

			--GumboStringPiece original_name;
		external
			"c inline use <gumbo.h>"
		alias
			"return &(((GumboAttribute *) $p)->original_name);"
		end

	c_value (p: POINTER): POINTER
			-- The value of the attribute.  This is in a freshly-allocated buffer to deal
			-- with unescaping, and is null-terminated.  It does not include any quotes
			-- that surround the attribute.  If the attribute has no value (for example,
			-- 'selected' on a checkbox), this will be an empty string.

			-- const char* value;
		external
			"c inline use <gumbo.h>"
		alias
			"return ((GumboAttribute *) $p)->value;"
		end

	c_original_value (p: POINTER): POINTER
			-- The original text of the value of the attribute.  This points into the
			-- original source buffer.  It includes any quotes that surround the
			-- attribute, and you can look at original_value.data[0] and
			-- original_value.data[original_value.length - 1] to determine what the quote
			-- characters were.  If the attribute has no value, this will be a 0-length
			-- string.
			--
			--  GumboStringPiece original_value;
		external
			"c inline use <gumbo.h>"
		alias
			"return &(((GumboAttribute *) $p)->original_value);"
		end

	c_name_start (p: POINTER): POINTER
			-- The starting position of the attribute name.
			--
			--  GumboSourcePosition name_start;
		external
			"c inline use <gumbo.h>"
		alias
			"return &(((GumboAttribute *) $p)->name_start);"
		end


	c_name_end (p: POINTER): POINTER
			--  The ending position of the attribute name.  This is not always derivable
			--  from the starting position of the value because of the possibility of
			--  whitespace around the = sign.
			--
			--  GumboSourcePosition name_end;
		external
			"c inline use <gumbo.h>"
		alias
			"return &(((GumboAttribute *) $p)->name_end);"
		end


	c_value_start (p: POINTER): POINTER
			--   The starting position of the attribute value.
			--
			--  GumboSourcePosition value_start
		external
			"c inline use <gumbo.h>"
		alias
			"return &(((GumboAttribute *) $p)->value_start);"
		end


	c_value_end (p: POINTER): POINTER
			-- The ending position of the attribute value.
			--
			-- GumboSourcePosition value_end
		external
			"c inline use <gumbo.h>"
		alias
			"return &(((GumboAttribute *) $p)->value_end);"
		end


	c_gumbo_get_attribute (a_attrs: POINTER; a_name: POINTER): POINTER
			-- Given a vector of GumboAttributes, look up the one with the specified name
			-- and return it, or NULL if no such attribute exists.  This uses a
			-- case-insensitive match, as HTML is case-insensitive.
			--
			-- GumboAttribute* gumbo_get_attribute(const GumboVector* attrs, const char* name);
		external
			"C inline use <gumbo.h>"
		alias
			"return (GumboAttribute*) gumbo_get_attribute((const GumboVector*)$a_attrs, (const char*)$a_name);"
		end


end
