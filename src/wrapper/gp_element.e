note
	description: "[
				  Represent all HTML elements.  This contains information
				  about the tag, attributes, and child nodes.
				 ]"
	date: "$Date$"
	revision: "$Revision$"

class
	GP_ELEMENT

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

	children: detachable GP_VECTOR
			-- Containing the children of this element	
		local
			l_pointer: POINTER
		do
			l_pointer := c_children (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	tag: GP_TAG
			-- tag for this element
		do
			create Result.make_by_value (c_tag (item))
		end

	tag_namespace: GP_NAMESPACE
			-- Namespace for this element.
		do
			create Result.make_by_value (c_tag_namespace (item))
		end

	original_tag: detachable GP_STRING_PIECE
			-- The original tag text for this element.
		local
			l_pointer: POINTER
		do
			l_pointer := c_original_tag (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	original_end_tag: detachable GP_STRING_PIECE
			-- The  original end tag text for this element.
		local
			l_pointer: POINTER
		do
			l_pointer := c_original_end_tag (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	start_pos: detachable GP_SOURCE_POSITION
			-- The source position for the start of the start tag.
		local
			l_pointer: POINTER
		do
			l_pointer := c_start_pos (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	end_pos: detachable GP_SOURCE_POSITION
			-- The source position for the start of the end tag.
		local
			l_pointer: POINTER
		do
			l_pointer := c_end_pos (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

	attributes: detachable GP_VECTOR
			-- Containing the attributes for this tag
		local
			l_pointer: POINTER
		do
			l_pointer := c_attributes (item)
			if l_pointer /= default_pointer then
				create Result.make_by_pointer (l_pointer)
			end
		end

feature {NONE} -- C external

	c_children (p: POINTER): POINTER
				-- An array of GumboNodes, containing the children of this element.  Pointers
				-- are owned
				-- GumboVector /* GumboNode* */ children;
		require p_not_null: p /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return &(((GumboElement *) $p)->children);"
    	end

   c_tag (p: POINTER): INTEGER
				-- The GumboTag enum for this element.
				-- GumboTag tag;
		require p_not_null: p /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return ((GumboElement *) $p)->tag;"
    	end


   c_tag_namespace (p: POINTER): INTEGER
				-- The GumboNamespaceEnum for this element.
				-- GumboNamespaceEnum tag_namespace;
		require p_not_null: p /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return ((GumboElement *) $p)->tag_namespace;"
    	end


   c_original_tag (p: POINTER): POINTER
				-- A GumboStringPiece pointing to the original tag text for this element,
				-- pointing directly into the source buffer.  If the tag was inserted
				-- algorithmically (for example, <head> or <tbody> insertion), this will be a
				-- zero-length string.
				--
				-- GumboStringPiece original_tag;
		require p_not_null: p /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return &(((GumboElement *) $p)->original_tag);"
    	end


   c_original_end_tag (p: POINTER): POINTER
				-- A GumboStringPiece pointing to the original end tag text for this element.
				-- If the end tag was inserted algorithmically, (for example, closing a
				-- self-closing tag), this will be a zero-length string.
				--
				-- GumboStringPiece original_end_tag;
		require p_not_null: p /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return &(((GumboElement *) $p)->original_end_tag);"
    	end

   c_start_pos (p: POINTER): POINTER
				-- The source position for the start of the start tag.
				-- GumboSourcePosition start_pos;
		require p_not_null: p /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return &(((GumboElement *) $p)->start_pos);"
    	end

   c_end_pos (p: POINTER): POINTER
				-- The source position for the start of the end tag.
				--  GumboSourcePosition end_pos
		require p_not_null: p /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return &(((GumboElement *) $p)->end_pos);"
    	end

   c_attributes (p: POINTER): POINTER
				-- An array of GumboAttributes, containing the attributes for this tag in the
				-- order that they were parsed.  Pointers are owned.
				--
				-- GumboVector /* GumboAttribute* */ attributes;	
		require p_not_null: p /= default_pointer
   		external
    		"C inline use <gumbo.h>"
    	alias
    		"return &(((GumboElement *) $p)->attributes);"
    	end

end
