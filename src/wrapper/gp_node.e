note
	description: "[
				 A supertype for GumboElement and GumboText, so that we can include one
				 generic type in lists of children and cast as necessary to subtypes.

			]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GP_NODE

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

	type: GP_NODE_TYPE
			-- The type of node that this is
		local
			l_pointer: POINTER
			l_cstring: C_STRING
		do
			create Result.make_by_value (c_type (item))
		end

	parent: detachable GP_NODE
			-- Reference to parent node.  Not owned.
		local
			l_pointer: POINTER
		do
			l_pointer := c_parent (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	parse_flags: GP_PARSE_FLAGS
			-- Flags containing information about why this element was
   			-- inserted into the parse tree
		do
			create Result.make_by_value (c_parse_flags (item))
		end

	document: detachable GP_DOCUMENT
			-- Current gumbo node document
		require
			is_document: type.is_node_document
		local
			l_pointer: POINTER
		do
			l_pointer := c_document (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	element: detachable GP_ELEMENT
			-- Current gumbo node element
		require
			is_element: type.is_node_element
		local
			l_pointer: POINTER
		do
			l_pointer := c_element (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	text: detachable GP_TEXT
			-- Current gumbo text
		require
			is_text: type.is_node_text
		local
			l_pointer: POINTER
		do
			l_pointer := c_text (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

feature {NONE} -- C externals

	c_type (p:POINTER): INTEGER
			-- The type of node that this is
		require
			p_not_null: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"return ((GumboNode *)$p)->type;"

		end

	c_parent (p:POINTER): POINTER
			-- Pointer back to parent node.  Not owned.
		require
			p_not_null: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			" return ((GumboNode *) $p)->parent;"
		end


	c_index_within_parent (p:POINTER): INTEGER
			-- The index within the parent's children vector of this node.
			--  size_t index_within_parent;
		require
			p_not_null: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			" return ((GumboNode *) $p)->index_within_parent;"
		end

	c_parse_flags (p:POINTER): INTEGER
			-- A bitvector of flags containing information about why this element was
			-- inserted into the parse tree, including a variety of special parse
			-- situations.
			-- GumboParseFlags parse_flags;
		require
			p_not_null: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			"return ((GumboNode *) $p)->parse_flags;"
		end

	c_document (p:POINTER): POINTER
		require
			p_not_null: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			" return &(((GumboNode *) $p)->v.document);"
		end


	c_element (p:POINTER): POINTER
		require
			p_not_null: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			" return &(((GumboNode *) $p)->v.element);"
		end

	c_text (p:POINTER): POINTER
		require
			p_not_null: p /= default_pointer
		external
			"C inline use <gumbo.h>"
		alias
			" return &(((GumboNode *) $p)->v.text);"
		end

end
