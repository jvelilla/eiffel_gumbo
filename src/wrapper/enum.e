note
	description: "Represent an enumerated type"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Enumerated type", "src=http://en.wikipedia.org/wiki/Enumerated_type", "protocol=uri"

deferred class
	ENUM

feature -- Access

	is_valid_state: BOOLEAN
			-- Is the value of the enumeration valid?
		do
			Result := is_valid_value (value)
		end

	value: INTEGER
			-- The current value of the enumeration.

	set_value (a_value: INTEGER)
			-- Set `value' with `a_value'
		require
			is_valid_value (a_value)
		do
			value := a_value
		ensure
			value_set: value = a_value
		end

	is_valid_value (a_value: INTEGER): BOOLEAN
			-- Can `a_value' be used in a `set_value' feature call?
		deferred
		end

invariant
	valid_state: is_valid_state

end -- class ENUM
