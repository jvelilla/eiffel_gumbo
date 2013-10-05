note
	description : "examples application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			example
		end

	example
		local
			l_string: STRING
			l_gumbo: GUMBO
			l_node: GP_NODE
		do
			l_string := "[
					<html><body class=\"gumbo\">Boo!</body></html>
				]"
			create l_gumbo

			io.output.flush

			if attached {GP_OUTPUT} l_gumbo.gumbo_parse (l_string) as l_output then
					-- Root
				if attached l_output.root as l_root then
					if l_root.type.is_node_element then
						print ("%NNode is an element")
						if attached l_root.element as l_element then
							if attached l_element.original_tag as l_original_tag then
								if attached l_original_tag.data as l_data then
									print ("%NData:" + l_data)
								end
							end
							if attached l_element.children as l_vector then
								print ("%NVector Count" + l_vector.count.out)
								create l_node.make_by_pointer (l_vector.at (1))
								if attached l_node.element as ll_element then
									if attached ll_element.original_end_tag as ll_original_end_tag then
										if attached ll_original_end_tag.data as ll_data then
											print ("%NData(1):" + ll_data)
										end
									end
								end
								create l_node.make_by_pointer (l_vector.at (2))
									if attached l_node.element as ll_element then
										if attached ll_element.original_tag as ll_original_tag then
											if attached ll_original_tag.data as ll_data then
												print ("%NData(2):" + ll_data)
											end
										end
									end

							end
						end
					end
				end
					-- Document
				if attached l_output.document as l_document then
					if l_document.type.is_node_document then
						print ("%NNode is an document")
					end
				end


			end
		end

end
