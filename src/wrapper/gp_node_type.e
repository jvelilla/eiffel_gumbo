note
	description: "Enum denoting the type of node.  This determines the type of the node.v union"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GP_NODE_TYPE

inherit

	ENUM

create
	make_by_value

feature {NONE} -- Initialization

	make_by_value (a_value: INTEGER)
		require
			is_valid: is_valid_value (a_value)
		do
			set_value (a_value)
		ensure
			value_set: value = a_value
		end

feature -- Query

	is_valid_value (a_value: INTEGER): BOOLEAN
			-- <Precursor>
		do
			Result := (a_value = c_gumbo_node_document) or else
					(a_value = c_gumbo_node_element) or else
					(a_value = c_gumbo_node_text) or else
					(a_value = c_gumbo_node_cdata) or else
					(a_value = c_gumbo_node_comment) or else
					(a_value = c_gumbo_node_whitespace)
		end

	is_node_document: BOOLEAN
		do
			Result := value = c_gumbo_node_document
		end

	is_node_element: BOOLEAN
		do
			Result := value = c_gumbo_node_element
		end

	is_node_text: BOOLEAN
		do
			Result := value = c_gumbo_node_text
		end

	is_node_cdata: BOOLEAN
		do
			Result := value = c_gumbo_node_cdata
		end

	is_node_comment: BOOLEAN
		do
			Result := value = c_gumbo_node_comment
		end

	is_node_whitespace: BOOLEAN
		do
			Result := value = c_gumbo_node_whitespace
		end



feature {NONE} -- C External

	c_gumbo_node_document: INTEGER
			-- Document node
		external
			"C inline use <gumbo.h>"
		alias
			"return (GumboNodeType)GUMBO_NODE_DOCUMENT"
		end

	c_gumbo_node_element: INTEGER
			-- Element node
		external
			"C inline use <gumbo.h>"
		alias
			"return (GumboNodeType)GUMBO_NODE_ELEMENT"
		end

	c_gumbo_node_text: INTEGER
			-- Text node
		external
			"C inline use <gumbo.h>"
		alias
			"return (GumboNodeType)GUMBO_NODE_TEXT"
		end

	c_gumbo_node_cdata: INTEGER
			-- CDATA node
		external
			"C inline use <gumbo.h>"
		alias
			"return (GumboNodeType)GUMBO_NODE_CDATA"
		end

	c_gumbo_node_comment: INTEGER
			-- Comment node
		external
			"C inline use <gumbo.h>"
		alias
			"return (GumboNodeType)GUMBO_NODE_COMMENT"
		end


	c_gumbo_node_whitespace: INTEGER
			-- Text node, where all contents is whitespace
		external
			"C inline use <gumbo.h>"
		alias
			"return (GumboNodeType)GUMBO_NODE_WHITESPACE"
		end


end
