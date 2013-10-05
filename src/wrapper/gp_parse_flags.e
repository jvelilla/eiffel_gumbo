note
	description: "[
				  Parse flags.
				  We track the reasons for parser insertion of nodes and store them in a
				  bitvector in the node itself.  This lets client code optimize out nodes that
				  are implied by the HTML structure of the document, or flag constructs that
				  may not be allowed by a style guide, or track the prevalence of incorrect or
				  tricky HTML code.
				]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GP_PARSE_FLAGS

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

feature -- Access

	is_valid_value (a_value: INTEGER): BOOLEAN
			-- <Precursor>
		do
			Result := (a_value = c_gumbo_insertion_normal) or else
					(a_value = c_gumbo_insertion_by_parser) or else
					(a_value = c_gumbo_insertion_implicit_end_tag) or else
					(a_value = c_gumbo_insertion_implied) or else
					(a_value = c_gumbo_insertion_converted_from_end_tag) or else
					(a_value = c_gumbo_insertion_from_isindex) or else
					(a_value = c_gumbo_insertion_from_image) or else
					(a_value = c_gumbo_insertion_reconstructed_formatting_element) or else
					(a_value = c_gumbo_insertion_adoption_agency_cloned) or else
					(a_value = c_gumbo_insertion_adoption_agency_moved) or else
					(a_value = c_gumbo_insertion_foster_parented)
		end

	is_gumbo_insertion_normal: BOOLEAN
		do
			Result := (value = c_gumbo_insertion_normal)
		end

	is_gumbo_insertion_by_parser: BOOLEAN
		do
			Result := (value = c_gumbo_insertion_by_parser)
		end

	is_gumbo_insertion_implicit_end_tag: BOOLEAN
		do
			Result := (value = c_gumbo_insertion_implicit_end_tag)
		end

	is_gumbo_insertion_implied: BOOLEAN
		do
			Result := (value = c_gumbo_insertion_implied)
		end

	is_gumbo_insertion_converted_from_end_tag: BOOLEAN
		do
			Result := (value = c_gumbo_insertion_converted_from_end_tag)
		end


	is_gumbo_insertion_from_isindex: BOOLEAN
		do
			Result := (value = c_gumbo_insertion_from_isindex)
		end

	is_gumbo_insertion_from_image: BOOLEAN
		do
			Result := (value = c_gumbo_insertion_from_image)
		end

	is_gumbo_insertion_reconstructed_formatting_element: BOOLEAN
		do
			Result := (value = c_gumbo_insertion_reconstructed_formatting_element)
		end

	is_gumbo_insertion_adoption_agency_cloned: BOOLEAN
		do
			Result := (value = c_gumbo_insertion_adoption_agency_cloned)
		end

	is_gumbo_insertion_adoption_agency_moved: BOOLEAN
		do
			Result := (value = c_gumbo_insertion_adoption_agency_moved)
		end

	is_gumbo_insertion_foster_parented: BOOLEAN
		do
			Result := (value = c_gumbo_insertion_foster_parented)
		end









feature {NONE} -- C externals

	c_gumbo_insertion_normal: INTEGER
				-- A normal node - both start and end tags appear in the source, nothing has
				-- been reparented.
				--
				--  GUMBO_INSERTION_NORMAL = 0,
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_INSERTION_NORMAL"
		end


	c_gumbo_insertion_by_parser: INTEGER
				-- A node inserted by the parser to fulfill some implicit insertion rule.
				-- This is usually set in addition to some other flag giving a more specific
				-- insertion reason; it's a generic catch-all term meaning "The start tag for
				-- this node did not appear in the document source".
				--  GUMBO_INSERTION_BY_PARSER = 1 << 0
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_INSERTION_BY_PARSER"
		end



	c_gumbo_insertion_implicit_end_tag: INTEGER
				-- A flag indicating that the end tag for this node did not appear in the
				-- document source.  Note that in some cases, you can still have
				-- parser-inserted nodes with an explicit end tag: for example, "Text</html>"
				-- has GUMBO_INSERTED_BY_PARSER set on the <html> node, but
				-- GUMBO_INSERTED_END_TAG_IMPLICITLY is unset, as the </html> tag actually
				-- exists.  This flag will be set only if the end tag is completely missing;
				-- in some cases, the end tag may be misplaced (eg. a </body> tag with text
				-- afterwards), which will leave this flag unset and require clients to
				-- inspect the parse errors for that case.
				--
				-- GUMBO_INSERTION_IMPLICIT_END_TAG = 1 << 1,

		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_INSERTION_IMPLICIT_END_TAG"
		end



	c_gumbo_insertion_implied: INTEGER
				-- A flag for nodes that are inserted because their presence is implied by
				-- other tags, eg. <html>, <head>, <body>, <tbody>, etc.
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_INSERTION_IMPLIED"
		end

	c_gumbo_insertion_converted_from_end_tag: INTEGER
				-- A flag for nodes that are converted from their end tag equivalents.  For
				-- example, </p> when no paragraph is open implies that the parser should
				-- create a <p> tag and immediately close it, while </br> means the same thing
				-- as <br>.
				-- GUMBO_INSERTION_CONVERTED_FROM_END_TAG = 1 << 4,
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_INSERTION_CONVERTED_FROM_END_TAG"
		end


	c_gumbo_insertion_from_isindex: INTEGER
				-- A flag for nodes that are converted from the parse of an <isindex> tag.
				-- GUMBO_INSERTION_FROM_ISINDEX = 1 << 5,
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_INSERTION_FROM_ISINDEX"
		end


	c_gumbo_insertion_from_image: INTEGER
				--  A flag for <image> tags that are rewritten as <img>.
				--  GUMBO_INSERTION_FROM_IMAGE = 1 << 6,
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_INSERTION_FROM_IMAGE"
		end



	c_gumbo_insertion_reconstructed_formatting_element: INTEGER
				-- A flag for nodes that are cloned as a result of the reconstruction of
				-- active formatting elements.  This is set only on the clone; the initial
				-- portion of the formatting run is a NORMAL node with an IMPLICIT_END_TAG.
				--
				-- GUMBO_INSERTION_RECONSTRUCTED_FORMATTING_ELEMENT = 1 << 7,
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_INSERTION_RECONSTRUCTED_FORMATTING_ELEMENT"
		end


	c_gumbo_insertion_adoption_agency_cloned: INTEGER
				-- A flag for nodes that are cloned by the adoption agency algorithm.
				-- GUMBO_INSERTION_ADOPTION_AGENCY_CLONED = 1 << 8,
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_INSERTION_ADOPTION_AGENCY_CLONED"
		end

	c_gumbo_insertion_adoption_agency_moved: INTEGER
				-- A flag for nodes that are moved by the adoption agency algorithm.
				-- GUMBO_INSERTION_ADOPTION_AGENCY_MOVED = 1 << 9,
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_INSERTION_ADOPTION_AGENCY_MOVED"
		end

	c_gumbo_insertion_foster_parented: INTEGER
				-- A flag for nodes that have been foster-parented out of a table (or
				--  should've been foster-parented, if verbatim mode is set).
				--
				-- GUMBO_INSERTION_FOSTER_PARENTED = 1 << 10,
		external
			"C inline use <gumbo.h>"
		alias
			"return GUMBO_INSERTION_FOSTER_PARENTED"
		end
end
