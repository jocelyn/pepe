﻿note
	description: "Pyton API externals, common routines and constants"
	author: "Daniel Rodríguez"
	file: "$Workfile: $"
	date: "$Date$"
	revision: "$Revision$"

class
	PYTHON_API

inherit

	EXCEPTIONS

feature -- Access (Constants)

	main_module_name: STRING = "__main__"

	doc_attribute_name: STRING = "__doc__"

feature -- Access (Error)

	Py_generator_exit: STRING = "PyExc_generator_exit"

	Py_arithmetic_error: STRING = "Py_arithmetic_error"

	Py_assertion_error: STRING = "Py_assertion_error"

	Py_attribute_error: STRING = "Py_attribute_error"

	Py_eof_error: STRING = "Py_eof_error"

	Py_environment_error: STRING = "Py_environment_error"

	Py_exception: STRING = "Py_exception"

	Py_floating_point_error: STRING = "Py_floating_point_error"

	Py_import_error: STRING = "Py_import_error"

	Py_indentation_error: STRING = "Py_indentation_error"

	Py_index_error: STRING = "Py_index_error"

	Py_io_error: STRING = "Py_io_error"

	Py_key_error: STRING = "Py_key_error"

	Py_keyboard_interrupt: STRING = "Py_keyboard_interrupt"

	Py_lookup_error: STRING = "Py_lookup_error"

	Py_memory_error: STRING = "Py_memory_error"

	Py_name_error: STRING = "Py_name_error"

	Py_not_implemented_error: STRING = "Py_not_implemented_error"

	Py_os_error: STRING = "Py_os_error"

	Py_overflow_error: STRING = "Py_overflow_error"

	Py_reference_error: STRING = "Py_reference_error"

	Py_stop_async_iteration: STRING = "Py_stop_async_iteration"

	Py_runtime_error: STRING = "Py_runtime_error"

	Py_standard_error: STRING = "Py_standard_error"

	Py_stop_iteration: STRING = "Py_stop_iteration"

	Py_syntax_error: STRING = "Py_syntax_error"

	Py_system_error: STRING = "Py_system_error"

	Py_system_exit: STRING = "Py_system_exit"

	Py_tab_error: STRING = "Py_tab_error"

	Py_type_error: STRING = "Py_type_error"

	Py_unbound_local_error: STRING = "Py_unbound_local_error"

	Py_unicode_error: STRING = "Py_unicode_error"

	Py_unicode_encode_error: STRING = "Py_unicode_encode_error"

	Py_unicode_decode_error: STRING = "Py_unicode_decode_error"

	Py_unicode_translate_error: STRING = "Py_unicode_translate_error"

	Py_value_error: STRING = "Py_value_error"

	Py_zero_division_error: STRING = "Py_zero_division_error"

	Py_warning: STRING = "Py_warning"

	Py_user_warning: STRING = "Py_user_warning"

	Py_deprecation_warning: STRING = "Py_deprecation_warning"

	Py_pending_deprecation_warning: STRING = "Py_pending_deprecation_warning"

	Py_syntax_warning: STRING = "Py_syntax_warning"

	Py_overflow_warning: STRING = "Py_overflow_warning"

	Py_runtime_warning: STRING = "Py_runtime_warning"

	Py_future_warning: STRING = "Py_future_warning"

	Py_buffer_error: STRING = "Py_buffer_error"

	Py_module_not_found_error: STRING = "Py_module_not_found_error"

	Py_blocking_io_error: STRING = "Py_blocking_io_error"

	Py_child_process_error: STRING = "Py_child_process_error"

	Py_broken_pipe_error: STRING = "Py_broken_pipe_error"

	Py_connection_aborted_error: STRING = "Py_connection_aborted_error"

	Py_connection_refused_error: STRING = "Py_connection_refused_error"

	Py_connection_reset_error: STRING = "Py_connection_reset_error"

	Py_connection_error: STRING = "Py_connection_error"

	Py_file_exists_error: STRING = "Py_file_exists_error"

	Py_file_not_found_error: STRING = "Py_file_not_found_error"

	Py_interrupted_error: STRING = "Py_interrupted_error"

	Py_is_a_directory_error: STRING = "Py_is_a_directory_error"

	Py_not_a_directory_error: STRING = "Py_not_a_directory_error"

	Py_permission_error: STRING = "Py_permission_error"

	Py_process_lookup_error: STRING = "Py_process_lookup_error"

	Py_timeout_error: STRING = "Py_timeout_error"

	Py_recursion_error: STRING = "Py_recursion_error"

	Py_import_warning: STRING = "Py_import_warning"

	Py_unicode_warning: STRING = "Py_unicode_warning"

	Py_bytes_warning: STRING = "Py_bytes_warning"

	Py_resource_warning: STRING = "Py_resource_warning"

	ocurred_python_exception: STRING
			-- String exception corresponding the python exception set.
		require
			error_exists: has_error
		do
			if c_py_err_exception_matches (c_py_exc_system_exit) = 1 then
				Result := Py_system_exit
			elseif c_py_err_exception_matches (c_py_exc_keyboard_interrupt) = 1 then
				Result := Py_keyboard_interrupt
			elseif c_py_err_exception_matches (c_py_exc_generator_exit) = 1 then
				Result := Py_generator_exit
			elseif c_py_err_exception_matches (c_py_exc_stop_iteration) = 1 then
				Result := py_stop_iteration
			elseif c_py_err_exception_matches (c_py_exc_stop_async_iteration) = 1 then
				Result := py_stop_iteration
			elseif c_py_err_exception_matches (c_py_exc_arithmetic_error) = 1 then
				if c_py_err_exception_matches (c_py_exc_overflow_error) = 1 then
					Result := Py_overflow_error
				elseif c_py_err_exception_matches (c_py_exc_floating_point_error) = 1 then
					Result := Py_floating_point_error
				elseif c_py_err_exception_matches (c_py_exc_zero_division_error) = 1 then
					Result := Py_zero_division_error
				else
					Result := Py_arithmetic_error
				end
			elseif c_py_err_exception_matches (c_py_exc_assertion_error) = 1 then
				Result := py_assertion_error
			elseif c_py_err_exception_matches (c_py_exc_attribute_error) = 1 then
				Result := py_attribute_error
			elseif c_py_err_exception_matches (c_py_exc_buffer_error) = 1 then
				Result := py_buffer_error
			elseif c_py_err_exception_matches (c_py_exc_eof_error) = 1 then
				Result := py_eof_error
			elseif c_py_err_exception_matches (c_py_exc_import_error) = 1 then
				if c_py_err_exception_matches (c_py_exc_module_not_found_error) = 1 then
					Result := Py_module_not_found_error
				else
					Result := Py_import_error
				end
			elseif c_py_err_exception_matches (c_py_exc_lookup_error) = 1 then
				if c_py_err_exception_matches (c_py_exc_index_error) = 1 then
					Result := Py_index_error
				elseif c_py_err_exception_matches (c_py_exc_key_error) = 1 then
					Result := Py_key_error
				else
					Result := Py_lookup_error
				end
			elseif c_py_err_exception_matches (c_py_exc_memory_error) = 1 then
				Result := Py_memory_error
			elseif c_py_err_exception_matches (c_py_exc_name_error) = 1 then
				if c_py_err_exception_matches (c_py_exc_unbound_local_error) = 1 then
					Result := Py_unbound_local_error
				else
					Result := Py_name_error
				end
			elseif c_py_err_exception_matches (c_py_exc_os_error) = 1 then
				if c_py_err_exception_matches (c_py_exc_blocking_io_error) = 1 then
					Result := Py_blocking_io_error
				elseif c_py_err_exception_matches (c_py_exc_child_process_error) = 1 then
					Result := Py_child_process_error
				elseif c_py_err_exception_matches (c_py_exc_connection_error) = 1 then
					if c_py_err_exception_matches (c_py_exc_broken_pipe_error) = 1 then
						Result := Py_broken_pipe_error
					elseif c_py_err_exception_matches (c_py_exc_connection_aborted_error) = 1 then
						Result := Py_connection_aborted_error
					elseif c_py_err_exception_matches (c_py_exc_connection_refused_error) = 1 then
						Result := Py_connection_refused_error
					elseif c_py_err_exception_matches (c_py_exc_connection_reset_error) = 1 then
						Result := Py_connection_reset_error
					else
						Result := Py_connection_error
					end
				elseif c_py_err_exception_matches (c_py_exc_file_exists_error) = 1 then
					Result := Py_file_exists_error
				elseif c_py_err_exception_matches (c_py_exc_file_not_found_error) = 1 then
					Result := Py_file_not_found_error
				elseif c_py_err_exception_matches (c_py_exc_interrupted_error) = 1 then
					Result := Py_interrupted_error
				elseif c_py_err_exception_matches (c_py_exc_is_a_directory_error) = 1 then
					Result := Py_is_a_directory_error
				elseif c_py_err_exception_matches (c_py_exc_not_a_directory_error) = 1 then
					Result := Py_not_a_directory_error
				elseif c_py_err_exception_matches (c_py_exc_permission_error) = 1 then
					Result := Py_permission_error
				elseif c_py_err_exception_matches (c_py_exc_process_lookup_error) = 1 then
					Result := Py_process_lookup_error
				elseif c_py_err_exception_matches (c_py_exc_timeout_error) = 1 then
					Result := Py_timeout_error
				else
					Result := Py_os_error
				end
			elseif c_py_err_exception_matches (c_py_exc_reference_error) = 1 then
				Result := py_reference_error
			elseif c_py_err_exception_matches (c_py_exc_runtime_error) = 1 then
				if c_py_err_exception_matches (c_py_exc_not_implemented_error) = 1 then
					Result := Py_not_implemented_error
				elseif c_py_err_exception_matches (c_py_exc_recursion_error) = 1 then
					Result := Py_recursion_error
				else
					Result := Py_runtime_error
				end
			elseif c_py_err_exception_matches (c_py_exc_syntax_error) = 1 then
				if c_py_err_exception_matches (c_py_exc_indentation_error) = 1 then
					if c_py_err_exception_matches (c_py_exc_tab_error) = 1 then
						Result := Py_tab_error
					else
						Result := Py_indentation_error
					end
				else
					Result := Py_syntax_error
				end
			elseif c_py_err_exception_matches (c_py_exc_system_error) = 1 then
				Result := Py_system_error
			elseif c_py_err_exception_matches (c_py_exc_type_error) = 1 then
				Result := Py_type_error
			elseif c_py_err_exception_matches (c_py_exc_value_error) = 1 then
				if c_py_err_exception_matches (c_py_exc_unicode_error) = 1 then
					if c_py_err_exception_matches (c_py_exc_unicode_encode_error) = 1 then
						Result := Py_unicode_encode_error
					elseif c_py_err_exception_matches (c_py_exc_unicode_decode_error) = 1 then
						Result := Py_unicode_decode_error
					elseif c_py_err_exception_matches (c_py_exc_unicode_translate_error) = 1 then
						Result := Py_unicode_translate_error
					else
						Result := Py_unicode_error
					end
				else
					Result := Py_value_error
				end
			elseif c_py_err_exception_matches (c_py_exc_warning) = 1 then
				if c_py_err_exception_matches (c_py_exc_user_warning) = 1 then
					Result := Py_user_warning
				elseif c_py_err_exception_matches (c_py_exc_deprecation_warning) = 1 then
					Result := Py_deprecation_warning
				elseif c_py_err_exception_matches (c_py_exc_pending_deprecation_warning) = 1 then
					Result := Py_pending_deprecation_warning
				elseif c_py_err_exception_matches (c_py_exc_syntax_warning) = 1 then
					Result := Py_syntax_warning
				elseif c_py_err_exception_matches (c_py_exc_runtime_warning) = 1 then
					Result := Py_runtime_warning
				elseif c_py_err_exception_matches (c_py_exc_future_warning) = 1 then
					Result := Py_future_warning
				elseif c_py_err_exception_matches (c_py_exc_import_warning) = 1 then
					Result := Py_import_warning
				elseif c_py_err_exception_matches (c_py_exc_unicode_warning) = 1 then
					Result := Py_unicode_warning
				elseif c_py_err_exception_matches (c_py_exc_bytes_warning) = 1 then
					Result := Py_bytes_warning
				elseif c_py_err_exception_matches (c_py_err_resource_warning) = 1 then
					Result := Py_resource_warning
				else
					Result := Py_warning
				end

			else
				Result := Py_exception
			end
		end

feature -- Status report

	has_error: BOOLEAN
			-- Has a error ocurred?
		do
			Result := c_py_err_occurred /= default_pointer
		end

feature -- Basic routines (API)

	s2p (s: STRING): POINTER
			-- String `s' converted to a char * pointer
		local
			a: ANY
		do
			a := s.to_c
			Result := ptr ($a)
		end

	ptr (p: POINTER): POINTER
			-- Return a pointer.
		do
			Result := p
		end

	type_of_object_ptr (o: POINTER): PYTHON_TYPE
			-- Python type object in Eiffel representing the Python type `o'.
		require
			o_not_null: o /= default_pointer
		local
			pyo: POINTER
		do
			pyo := c_py_object_type (o)
			create Result.new (pyo)
		end

	type_ptr_of_object_ptr (o: POINTER): POINTER
			-- Python type object in Eiffel representing the Python type `o'.
		require
			o_not_null: o /= default_pointer
		do
			Result := c_py_object_type (o)
		end

	new_python_object (o: POINTER): PYTHON_OBJECT
			-- New Python object with object pointer `o'.
		local
			otype: PYTHON_TYPE
		do
			otype := type_of_object_ptr (o)
			if otype.is_class_type then
				create {PYTHON_CLASS} Result.new (o)
			elseif otype.is_dictionary_type then
				create {PYTHON_DICTIONARY} Result.new (o)
			elseif otype.is_string_type then
				create {PYTHON_STRING} Result.new (o)
			elseif otype.is_list_type then
				create {PYTHON_LIST} Result.new (o)
			elseif otype.is_tuple_type then
				create {PYTHON_TUPLE} Result.new (o)
			elseif otype.is_module_type then
				create {PYTHON_MODULE} Result.new (o)
			elseif otype.is_integer_type then
				create {PYTHON_INTEGER} Result.new (o)
			elseif otype.is_boolean_type then
				create {PYTHON_BOOLEAN} Result.new (o)
			elseif otype.is_none_type then
				create {PYTHON_NONE} Result.new_none
			else
					-- Result := otype.str
				create Result.new (o)
			end
		end

	borrowed_python_object (o: POINTER): PYTHON_OBJECT
			-- Borrowed Python object with object pointer `o'.
		local
			otype: PYTHON_TYPE
		do
			otype := type_of_object_ptr (o)
			if otype.is_integer_type then
				create {PYTHON_INTEGER} Result.borrowed (o)
			elseif otype.is_module_type then
				create {PYTHON_MODULE} Result.borrowed (o)
			elseif otype.is_class_type then
				create {PYTHON_CLASS} Result.borrowed (o)
			elseif otype.is_dictionary_type then
				create {PYTHON_DICTIONARY} Result.borrowed (o)
			elseif otype.is_list_type then
				create {PYTHON_LIST} Result.borrowed (o)
			elseif otype.is_tuple_type then
				create {PYTHON_TUPLE} Result.borrowed (o)
			elseif otype.is_string_type then
				create {PYTHON_STRING} Result.borrowed (o)
			elseif otype.is_none_type then
				create {PYTHON_NONE} Result.borrowed_none
			else
					--Result := otype.str
				create Result.borrowed (o)
			end
		end

	python_object_type_check (o, t: POINTER): BOOLEAN
			-- Is object `o' of type 't?
		require
			o_not_null: o /= default_pointer
			t_not_null: t /= default_pointer
		do
			Result := c_py_object_type_check (o, t) = 1
		end

	class_type: PYTHON_TYPE
			-- Type object representation in Eiffel of a Python class
		once
			create Result.borrowed (c_py_type_type)
		end

	dictionary_type: PYTHON_TYPE
			-- Type object representation in Eiffel of a Python dictionary
		once
			create Result.borrowed (c_py_dict_type)
		end

	integer_type: PYTHON_TYPE
			-- Type object representation in Eiffel of a Python integer
		once
			create Result.borrowed ({PY_LONG_OBJECT}.py_long_type)
		end

	boolean_type: PYTHON_TYPE
			-- Type object representation in Eiffel of a Python boolean
		once
			create Result.borrowed (c_py_bool_type)
		end

	list_type: PYTHON_TYPE
			-- Type object representation in Eiffel of a Python list
		once
			create Result.borrowed (c_py_list_type)
		end

	tuple_type: PYTHON_TYPE
			-- Type object representation in Eiffel of a Python tuple
		once
			create Result.borrowed (c_py_tuple_type)
		end

	module_type: PYTHON_TYPE
			-- Type object representation in Eiffel of a Python module
		once
			create Result.borrowed (c_py_module_type)
		end

	none_type: PYTHON_TYPE
			-- Type object representation in Eiffel of a Python None object
		once
			create Result.borrowed (none_object.py_type_ptr)
		end

	string_type: PYTHON_TYPE
			-- Type object representation in Eiffel of a Python string
		once
				--create Result.borrowed (c_py_string_type)
			create Result.borrowed ({PY_UNICODE_OBJECT}.py_unicode_type)
		end

	none_object: PYTHON_NONE
			-- The unique instance None
		once
			create Result.borrowed_none
		end

feature {NONE} -- Externals

	c_py_eval_input: INTEGER
			-- Start symbol for interpreting isolated expressions.
			-- When using Py_eval_input, the input string must contain a single expression and its result is returned.
		external
			"C [macro %"Python.h%"]"
		alias
			"Py_eval_input"
		end

	c_py_file_input: INTEGER
			-- Start symbol for interpreting sequences of statements.
			-- When using Py_file_input, the string can contain an abitrary number of statements and None is returned.
		external
			"C [macro %"Python.h%"]"
		alias
			"Py_file_input"
		end

	c_py_single_input: INTEGER
			-- Start symbol for interpreting a single statement.
			-- Py_single_input works in the same way as Py_file_input but only accepts a single statement.
		external
			"C [macro %"Python.h%"]"
		alias
			"Py_single_input"
		end

	c_py_initialize
			-- Initialize the interpreter.
		external
			"C | %"Python.h%""
		alias
			"Py_Initialize"
		end

	c_py_is_initialized: INTEGER
			-- Is the interpreter initialized?.
		external
			"C | %"Python.h%""
		alias
			"Py_IsInitialized"
		end

	c_py_finalize
			-- Undo all initializations made by c_py_initialize
			-- see c_py_finalize_ex
		external
			"C | %"Python.h%""
		alias
			"Py_Finalize"
		end

	c_py_finalize_ex
			-- Undo all initializations made by Py_Initialize() and subsequent use of Python/C API functions, and destroy all sub-interpreters
			-- (see Py_NewInterpreter() below) that were created and not yet destroyed since the last call to Py_Initialize().
			-- Ideally, this frees all memory allocated by the Python interpreter. This is a no-op when called for a second time (without calling Py_Initialize() again first).
			-- Normally the return value is 0. If there were errors during finalization (flushing buffered data), -1 is returned.
			-- This function is provided for a number of reasons. An embedding application might want to restart Python without having to restart the application itself.
			-- An application that has loaded the Python interpreter from a dynamically loadable library (or DLL) might want to free all memory allocated by Python before unloading the DLL.
			-- During a hunt for memory leaks in an application a developer might want to free all memory allocated by Python before exiting from the application.
			-- Bugs and caveats: The destruction of modules and objects in modules is done in random order; this may cause destructors (__del__() methods) to fail when they depend on other objects (even functions) or modules.
			-- Dynamically loaded extension modules loaded by Python are not unloaded. Small amounts of memory allocated by the Python interpreter may not be freed (if you find a leak, please report it).
			-- Memory tied up in circular references between objects is not freed. Some memory allocated by extension modules may not be freed.
			-- Some extensions may not work properly if their initialization routine is called more than once; this can happen if an application calls Py_Initialize() and Py_FinalizeEx() more than once.
			--  Raises an auditing event cpython._PySys_ClearAuditHooks with no arguments.
		external
			"C | %"Python.h%""
		alias
			"Py_FinalizeEx"
		end

	c_py_run_simple_string (p: POINTER): INTEGER
			-- Executes the Python source code from command in the __main__ module.
			-- If __main__ does not already exist, it is created.
			-- Returns 0 on success or -1 if an exception was raised.
			-- If there was an error, there is no way to get the exception information.
		external
			"C | %"Python.h%""
		alias
			"PyRun_SimpleString"
		end

	c_py_run_simple_file (fp, fn: POINTER): INTEGER
			-- Similar to PyRun_SimpleString(), but the Python source code is read from `fp' instead of an in-memory string.
			-- `fn' should be the name of the file.
		external
			"C | %"Python.h%""
		alias
			"PyRun_SimpleFile"
		end

	c_py_run_string (str: POINTER; start: INTEGER; globals, locals: POINTER): POINTER
			-- Return value: New reference.
			-- Execute Python source code from `str' in the context specified by the dictionaries globals and locals.
			-- The parameter start specifies the start token that should be used to parse the source code.
			-- Returns the result of executing the code as a Python object,
			-- or NULL if an exception was raised.
		external
			"C | %"Python.h%""
		alias
			"PyRun_String"
		end

	c_py_run_file (fp, fn: POINTER; start: INTEGER; globals, locals: POINTER): POINTER
			-- Return value: New reference.
			-- Similar to PyRun_String(), but the Python source code is read from `fp' instead of an in-memory string.
			-- `fn' should be the name of the file.
		external
			"C | %"Python.h%""
		alias
			"PyRun_File"
		end

	c_py_compile_string (str, fn: POINTER; start: INTEGER): POINTER
			-- Return value: New reference.
			-- Parse and compile the Python source code in `str', returning the resulting code object.
			-- The start token is given by start;
			-- this can be used to constrain the code which can be compiled and should be Py_eval_input, Py_file_input, or Py_single_input.
			-- The filename specified by `fn' is used to construct the code object and may appear in tracebacks or SyntaxError exception messages.
			-- This returns NULL if the code cannot be parsed or compiled.
		external
			"C | %"Python.h%""
		alias
			"Py_CompileString"
		end



	c_py_eval_get_builtins
			-- Get the "__bulitins_ attribute of the current namespace
		external
			"C | %"Python.h%""
		alias
			"PyEval_GetBuiltins"
		end

feature {NONE} -- Externals (Reference Counting)

		c_py_incref (o: POINTER)
				-- Increment the reference count for object `o`.
				-- The object must not be NULL; if you aren’t sure that it isn’t NULL, use Py_XINCREF().			
			require
				not_null_object: o /= default_pointer
			external
				"C [macro %"Python.h%"](PyObject*)"
			alias
				"Py_INCREF"
			end

		c_py_xincref (o: POINTER)
				-- Increment the reference count for object o.
				-- The object may be NULL, in which case the macro has no effect.
			external
				"C [macro %"Python.h%"](PyObject*)"
			alias
				"Py_XINCREF"
			end


	c_py_decref (o: POINTER)
			-- Decrement the reference count for object `o'.
			-- The object must not be NULL; if you aren't sure that it isn't NULL,
			-- use Py_XDECREF().
			-- If the reference count reaches zero,
			-- the object's type's deallocation function (which must not be NULL) is invoked.
			--
			-- Warning: The deallocation function can cause arbitrary Python code to be invoked
			-- (e.g. when a class instance with a __del__() method is deallocated).
			-- While exceptions in such code are not propagated,
			-- the executed code has free access to all Python global variables.
			-- This means that any object that is reachable from a global variable should be in a consistent state before Py_DECREF() is invoked.
			-- For example, code to delete an object from a list should copy a reference to the deleted object in a temporary variable,
			-- update the list data structure, and then call Py_DECREF() for the temporary variable.
		require
			not_null_object: o /= default_pointer
		external
			"C [macro %"Python.h%"](PyObject*)"
		alias
			"Py_DECREF"
		end

	c_py_clear (o: POINTER)
			-- Decrement the reference count for object `o`.
			-- The object may be NULL, in which case the macro has no effect; otherwise the effect is the same as for Py_DECREF(), except that the argument is also set to NULL.
			-- The warning for Py_DECREF() does not apply with respect to the object passed because the macro carefully uses a temporary variable and sets the argument to NULL before decrementing its reference count.
			-- It is a good idea to use this macro whenever decrementing the reference count of an object that might be traversed during garbage collection.		
		external
			"C [macro %"Python.h%"](PyObject*)"
		alias
			"Py_CLEAR"
		end

feature {NONE} -- Externals (Classes)


feature {NONE} -- Externals (Dictionary Objects)

	c_py_dict_type: POINTER
			-- This instance of PyTypeObject represents the Python dictionary type.
			-- This is exposed to Python programs as types.DictType and types.DictionaryType.
		external
			"C [macro %"Python.h%"]"
		alias
			"&PyDict_Type"
		end

	c_py_dict_check (p: POINTER): INTEGER
			-- Returns 1 if its argument is a PyDictObject.
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PyDict_Check"
		end

	c_py_dict_new: POINTER
			-- Return value: New reference.
			-- Returns a new empty dictionary, or NULL on failure.
		external
			"C | %"Python.h%""
		alias
			"PyDict_New"
		end

	c_py_dict_clear (o: POINTER)
			--     Empties an existing dictionary of all key-value pairs.
		external
			"C | %"Python.h%""
		alias
			"PyDict_Clear"
		end

	c_py_dict_copy (o: POINTER): POINTER
			-- Return value: New reference.
			-- Returns a new dictionary that contains the same key-value pairs as `o'. New in version 1.6.
		external
			"C | %"Python.h%""
		alias
			"PyDict_Copy"
		end

	c_py_dict_set_item (o, k, v: POINTER): INTEGER
			-- Inserts value into the dictionary `o' with a key of `k'.
			--`k' must be hashable; if it isn't, TypeError will be raised.
			-- Returns 0 on success or -1 on failure.
		external
			"C | %"Python.h%""
		alias
			"PyDict_SetItem"
		end

	c_py_dict_set_item_string (o, k, v: POINTER): INTEGER
			-- Inserts value into the dictionary `o' using `k' as a key.
			--`k' should be a char*.
			-- The key object is created using PyString_FromString(key).
			-- Returns 0 on success or -1 on failure.
		external
			"C | %"Python.h%""
		alias
			"PyDict_SetItemString"
		end

	c_py_dict_del_item (o, k: POINTER): INTEGER
			-- Removes the entry in dictionary `o' with key `k'.
			-- `k' must be hashable; if it isn't, TypeError is raised.
		external
			"C | %"Python.h%""
		alias
			"PyDict_DelItem"
		end

	c_py_dict_del_item_string (o, k: POINTER): INTEGER
			-- Removes the entry in dictionary `o' which has a key specified by the string `k'.
			-- Returns 0 on success or -1 on failure.
		external
			"C | %"Python.h%""
		alias
			"PyDict_DelItemString"
		end

	c_py_dict_get_item (o, k: POINTER): POINTER
			-- Return value:  Borrowed reference.
			-- Returns the object from dictionary `o' which has a key `k'.
			-- Returns NULL if the key `k' is not present, but without setting an exception.
		external
			"C | %"Python.h%""
		alias
			"PyDict_GetItem"
		end

	c_py_dict_get_item_string (o, k: POINTER): POINTER
			-- Return value:  Borrowed reference.
			-- This is the same as PyDict_GetItem(), but `k' is specified as a char*, rather than a PyObject*.
		external
			"C | %"Python.h%""
		alias
			"PyDict_GetItemString"
		end

	c_py_dict_items (o: POINTER): POINTER
			-- Return value: New reference.
			-- Returns a PyListObject containing all the items from the dictionary,
			-- as in the dictinoary method items() (see the Python Library Reference).
		external
			"C | %"Python.h%""
		alias
			"PyDict_Items"
		end

	c_py_dict_keys (o: POINTER): POINTER
			-- Return value: New reference.
			-- Returns a PyListObject containing all the keys from the dictionary,
			-- as in the dictionary method keys() (see the Python Library Reference).
		external
			"C | %"Python.h%""
		alias
			"PyDict_Keys"
		end

	c_py_dict_values (o: POINTER): POINTER
			-- Return value: New reference.
			-- Returns a PyListObject containing all the values from the dictionary p,
			-- as in the dictionary method values() (see the Python Library Reference).
		external
			"C | %"Python.h%""
		alias
			"PyDict_Values"
		end

	c_py_dict_Size (o: POINTER): INTEGER
			-- Returns the number of items in the dictionary.
			-- This is equivalent to "len(p)" on a dictionary.
		external
			"C | %"Python.h%""
		alias
			"PyDict_Size"
		end

feature {NONE} -- Externals (Error)

	c_py_exc_generator_exit: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_GeneratorExit"
		end

	c_py_exc_exception: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_Exception"
		end

	c_py_exc_lookup_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_LookupError"
		end

	c_py_exc_arithmetic_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_ArithmeticError"
		end

	c_py_exc_assertion_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_AssertionError"
		end

	c_py_exc_attribute_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_AttributeError"
		end

	c_py_exc_eof_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_EOFError"
		end

	c_py_exc_environment_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_EnvironmentError"
		end

	c_py_exc_floating_point_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_FloatingPointError"
		end

	c_py_exc_indentation_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_IndentationError"
		end

	c_py_exc_import_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_ImportError"
		end

	c_py_exc_index_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_IndexError"
		end

	c_py_exc_io_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_IOError"
		end

	c_py_exc_key_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_KeyError"
		end

	c_py_exc_keyboard_interrupt: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_KeyboardInterrupt"
		end

	c_py_exc_memory_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_MemoryError"
		end

	c_py_exc_name_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_NameError"
		end

	c_py_exc_not_implemented_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_NotImplementedError"
		end

	c_py_exc_os_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_OSError"
		end

	c_py_exc_overflow_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_OverflowError"
		end

	c_py_exc_reference_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_ReferenceError"
		end

	c_py_exc_runtime_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_RuntimeError"
		end

	c_py_exc_stop_iteration: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_StopIteration"
		end

	c_py_exc_syntax_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_SyntaxError"
		end

	c_py_exc_system_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_SystemError"
		end

	c_py_exc_system_exit: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_SystemExit"
		end

	c_py_exc_type_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_TypeError"
		end

	c_py_exc_tab_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_TabError"
		end

	c_py_exc_unbound_local_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_UnboundLocalError"
		end

	c_py_exc_unicode_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_UnicodeError"
		end

	c_py_exc_unicode_encode_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_UnicodeEncodeError"
		end

	c_py_exc_unicode_decode_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_UnicodeDecodeError"
		end

	c_py_exc_unicode_translate_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_UnicodeTranslateError"
		end

	c_py_exc_value_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_ValueError"
		end

	c_py_exc_warning: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_Warning"
		end

	c_py_exc_user_warning: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_UserWarning"
		end

	c_py_exc_deprecation_warning: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_DeprecationWarning"
		end

	c_py_exc_pending_deprecation_warning: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_PendingDeprecationWarning"
		end

	c_py_exc_syntax_warning: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_SyntaxWarning"
		end

		--	c_py_exc_overflow_warning: POINTER is
		--			--
		--		external
		--			"C [macro %"Python.h%"]:PyObject *"
		--		alias
		--			"PyExc_OverflowWarning"
		--		end

	c_py_exc_runtime_warning: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_RuntimeWarning"
		end

	c_py_exc_future_warning: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_FutureWarning"
		end

		--	c_py_exc_windows_error is
		--			--
		--		external
		--			"C [macro %"Python.h%"]"
		--		alias
		--			"PyExc_WindowsError"
		--		end

		--	Py_windows_error: STRING is "Py_windows_error"
		--

	c_py_exc_zero_division_error: POINTER
			--
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_ZeroDivisionError"
		end

	c_py_exc_stop_async_iteration: POINTER
			-- Must be raised by __anext__() method of an asynchronous iterator object to stop the iteration.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_StopAsyncIteration"
		end

	c_py_exc_buffer_error: POINTER
			-- Raised when a buffer related operation cannot be performed.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_BufferError"
		end

	c_py_exc_module_not_found_error: POINTER
			-- Raised when a buffer related operation cannot be performed.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_ModuleNotFoundError"
		end

	c_py_exc_blocking_io_error: POINTER
			-- Raised when an operation would block on an object (e.g. socket) set for non-blocking operation.
			-- Corresponds to errno EAGAIN, EALREADY, EWOULDBLOCK and EINPROGRESS.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_BlockingIOError"
		end

	c_py_exc_child_process_error: POINTER
			-- Raised when an operation on a child process failed.
			-- Corresponds to errno ECHILD.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_ChildProcessError"
		end

	c_py_exc_connection_error: POINTER
			-- A base class for connection-related issues.
			-- Subclasses are BrokenPipeError, ConnectionAbortedError, ConnectionRefusedError and ConnectionResetError.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_ConnectionError"
		end

	c_py_exc_connection_aborted_error: POINTER
			-- A subclass of ConnectionError, raised when a connection attempt is aborted by the peer.
			-- Corresponds to errno ECONNABORTED.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_ConnectionAbortedError"
		end

	c_py_exc_connection_refused_error: POINTER
			-- A subclass of ConnectionError, raised when a connection attempt is refused by the peer.
			-- Corresponds to errno ECONNREFUSED.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_ConnectionRefusedError"
		end

	c_py_exc_connection_reset_error: POINTER
			-- A subclass of ConnectionError, raised when a connection is reset by the peer.
			-- Corresponds to errno ECONNRESET.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_ConnectionResetError"
		end

	c_py_exc_broken_pipe_error: POINTER
			-- A subclass of ConnectionError, raised when trying to write on a pipe while the other end has been closed, or trying to write on a socket which has been shutdown for writing.
			-- Corresponds to errno EPIPE and ESHUTDOWN.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_BrokenPipeError"
		end

	c_py_exc_file_exists_error: POINTER
			-- Raised when trying to create a file or directory which already exists.
			-- Corresponds to errno EEXIST.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_FileExistsError"
		end

	c_py_exc_file_not_found_error: POINTER
			-- Raised when a file or directory is requested but doesn’t exist.
			--Corresponds to errno ENOENT.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_FileNotFoundError"
		end

	c_py_exc_interrupted_error: POINTER
			-- Raised when a system call is interrupted by an incoming signal. Corresponds to errno EINTR.
			-- Changed in version 3.5: Python now retries system calls when a syscall is interrupted by a signal,
			-- except if the signal handler raises an exception (see PEP 475 for the rationale), instead of raising InterruptedError.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_InterruptedError"
		end

	c_py_exc_is_a_directory_error: POINTER
			-- Raised when a file operation (such as os.remove()) is requested on a directory.
			-- Corresponds to errno EISDIR.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_IsADirectoryError"
		end

	c_py_exc_not_a_directory_error: POINTER
			-- Raised when a directory operation (such as os.listdir()) is requested on something which is not a directory.
			-- Corresponds to errno ENOTDIR.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_NotADirectoryError"
		end

	c_py_exc_permission_error: POINTER
			-- Raised when trying to run an operation without the adequate access rights - for example filesystem permissions.
			-- Corresponds to errno EACCES and EPERM.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_PermissionError"
		end

	c_py_exc_process_lookup_error: POINTER
			-- Raised when a given process doesn’t exist.
			-- Corresponds to errno ESRCH.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_ProcessLookupError"
		end

	c_py_exc_timeout_error: POINTER
			-- Raised when a system function timed out at the system level.
			-- Corresponds to errno ETIMEDOUT.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_TimeoutError"
		end

	c_py_exc_recursion_error: POINTER
			-- This exception is derived from RuntimeError.
			-- It is raised when the interpreter detects that the maximum recursion depth (see sys.getrecursionlimit()) is exceeded.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_RecursionError"
		end

	c_py_exc_import_warning: POINTER
			-- Base class for warnings about probable mistakes in module imports.
			-- Ignored by the default warning filters. Enabling the Python Development Mode shows this warning.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_ImportWarning"
		end

	c_py_exc_unicode_warning: POINTER
			-- Base class for warnings related to Unicode.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_UnicodeWarning"
		end

	c_py_exc_bytes_warning: POINTER
			-- Base class for warnings related to bytes and bytearray.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyExc_BytesWarning"
		end

	c_py_err_resource_warning: POINTER
			-- Base class for warnings related to resource usage.
			-- Ignored by the default warning filters. Enabling the Python Development Mode shows this warning.
		external
			"C [macro %"Python.h%"]:PyObject *"
		alias
			"PyErr_ResourceWarning"
		end

	c_py_err_occurred: POINTER
			-- Return value: Borrowed reference.
			-- Test whether the error indicator is set.
			-- If set, return the exception type (the first argument to the last call to one of the PyErr_Set*() functions or to PyErr_Restore()).
			-- If not set, return NULL.
			-- You do not own a reference to the return value, so you do not need to Py_DECREF() it.
			-- Note: Do not compare the return value to a specific exception; use PyErr_ExceptionMatches() instead, shown below.
			-- (The comparison could easily fail since the exception may be an instance instead of a class,
			-- in the case of a class exception, or it may the a subclass of the expected exception.)
		external
			"C | %"Python.h%""
		alias
			"PyErr_Occurred"
		end

	c_py_err_print
			-- Print a standard traceback to sys.stderr and clear the error indicator.
			--Call this function only when the error indicator is set. (Otherwise it will cause a fatal error!)
		external
			"C | %"Python.h%""
		alias
			"PyErr_Print"
		end

	c_py_err_exception_matches (exc: POINTER): INTEGER
			-- Equivalent to "PyErr_GivenExceptionMatches(PyErr_Occurred(), exc)".
			-- This should only be called when an exception is actually set;
			-- a memory access violation will occur if no exception has been raised.
		external
			"C | %"Python.h%""
		alias
			"PyErr_ExceptionMatches"
		end

	c_py_err_given_exception_matches (given, exc: POINTER): INTEGER
			-- Return true if the given exception matches the exception in exc.
			-- If exc is a class object, this also returns true when given is an instance of a subclass.
			-- If exc is a tuple, all exceptions in the tuple (and recursively in subtuples) are searched for a match.
			-- If given is NULL, a memory access violation will occur.
		external
			"C | %"Python.h%""
		alias
			"PyErr_GivenExceptionMatches"
		end

	c_py_err_clear
			-- Clear the error indicator. If the error indicator is not set, there is no effect.
		external
			"C | %"Python.h%""
		alias
			"PyErr_Clear"
		end

feature {NONE} -- Externals (Import)

	c_py_import_import_module (name: POINTER): POINTER
			-- Return value: New reference.
			-- This is a simplified interface to PyImport_ImportModuleEx() below,
			-- leaving the globals and locals arguments set to NULL.
			-- When the name argument contains a dot (when it specifies a submodule of a package),
			-- the fromlist argument is set to the list ['*']
			-- so that the return value is the named module rather than the top-level package containing it as would otherwise be the case.
			--(Unfortunately, this has an additional side effect when name in fact specifies a subpackage instead of a submodule:
			-- the submodules specified in the package's __all__ variable are    loaded.)
			-- Return a new reference to the imported module, or NULL with an exception set on failure
			-- (the module may still be created in this case -- examine sys.modules to find out).
		external
			"C | %"Python.h%""
		alias
			"PyImport_ImportModule"
		end

	c_py_import_import_module_ex (name, globals, locals, fromlist: POINTER): POINTER
			-- Return value: New reference.
			-- Import a module.
			-- This is best described by referring to the built-in Python function __import__()  as the standard __import__() function calls this function directly.
		external
			"C | %"Python.h%""
		alias
			"PyImport_ImportModuleEx"
		end

	c_py_import_import (name: POINTER): POINTER
			-- Return value: New reference.
			-- This is a higher-level interface that calls the current ``import hook function''.
			-- It invokes the __import__() function from the __builtins__ of the current globals.
			-- This means that the import is done using whatever import hooks are installed in the current environment, e.g. by rexec  or ihooks
		external
			"C | %"Python.h%""
		alias
			"PyImport_Import"
		end

	c_py_import_reload_module (name: POINTER): POINTER
			-- Return value: New reference.
			-- Reload a module.
			-- This is best described by referring to the built-in Python function reload()
			-- as the standard reload() function calls this function directly.
			-- Return a new reference to the reloaded module, or NULL with an exception set on failure (the module still exists in this case).
		external
			"C | %"Python.h%""
		alias
			"PyImport_ReloadModule"
		end

	c_py_import_add_module (name: POINTER): POINTER
			-- Return value: Borrowed reference.
			-- Return the module object corresponding to a module name.
			-- The name argument may be of the form package.module).
			-- First check the modules dictionary if there's one there, and if not, create a new one and insert in in the modules dictionary.
			-- Return NULL with an exception set on failure.
			-- Note: This function does not load or import the module; if the module wasn't already loaded, you will get an empty module object.
			-- Use PyImport_ImportModule() or one of its variants to import a module. Package structures implied by a dotted name for name are not created if not already present.
		external
			"C | %"Python.h%""
		alias
			"PyImport_AddModule"
		end

	c_py_import_get_module_dict: POINTER
			-- Return value:  Borrowed reference.
			-- Return the dictionary used for the module administration (a.k.a. sys.modules).
			-- Note that this is a per-interpreter variable.
		external
			"C | %"Python.h%""
		alias
			"PyImport_GetModuleDict"
		end

feature {NONE} -- Externals (Boolean)

	c_py_bool_type: POINTER
			-- This instance of PyTypeObject represents the Python boolean type.
		external
			"C [macro %"Python.h%"]"
		alias
			"&PyBool_Type"
		end

	c_py_bool_check (o: POINTER): INTEGER
			-- Return true if o is of type PyBool_Type. New in version 2.3.
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PyBool_Check"
		end

	c_py_bool_from_long (i: INTEGER): POINTER
			-- Return a new reference to Py_True or Py_False
			-- depending on the truth value of v. New in version
			-- 2.3.
		external
			"C | %"Python.h%""
		alias
			"PyBool_FromLong"
		end

	c_py_false: POINTER
			-- The Python False object. This object has no
			-- methods. It needs to be treated just like any other
			-- object with respect to reference counts.
		external
			"C [macro %"Python.h%"]"
		alias
			"Py_False"
		end

	c_py_true: POINTER
			-- The Python True object. This object has no
			-- methods. It needs to be treated just like any other
			-- object with respect to reference counts.
		external
			"C [macro %"Python.h%"]"
		alias
			"Py_True"
		end

feature {NONE} -- Externals (List Objects)

	c_py_list_type: POINTER
			-- This instance of PyTypeObject represents the Python list type.
			-- This is the same object as types.ListType.
		external
			"C [macro %"Python.h%"]"
		alias
			"&PyList_Type"
		end

	c_py_list_check (o: POINTER): INTEGER
			-- Returns true if its argument is a PyListObject.
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PyList_Check"
		end

	c_py_list_new (l: INTEGER): POINTER
			-- Return value: New reference.
			-- Returns a new list of length len on success, or NULL on failure.
		external
			"C | %"Python.h%""
		alias
			"PyList_New"
		end

	c_py_list_size (o: POINTER): INTEGER
			-- Returns the length of the list object in list;
			-- this is equivalent to "len(list)" on a list object.
		external
			"C | %"Python.h%""
		alias
			"PyList_Size"
		end

	c_py_list_get_item (o: POINTER; pos: INTEGER): POINTER
			-- Return value: Borrowed reference.
			-- Returns the object at position `pos' in the list pointed to by `o'.
			-- If `pos' is out of bounds, returns NULL and sets an IndexError exception.
		external
			"C | %"Python.h%""
		alias
			"PyList_GetItem"
		end

	c_py_list_set_item (o: POINTER; pos: INTEGER; i: POINTER): INTEGER
			-- Sets the item at index `pos' in list `o' to item `i'.
			-- Returns 0 on success or -1 on failure.
			-- Note: This function ``steals'' a reference to item
			-- and discards a reference to an item already in the list at the affected position.
		external
			"C | %"Python.h%""
		alias
			"PyList_SetItem"
		end

	c_py_list_insert (o: POINTER; pos: INTEGER; i: POINTER): INTEGER
			-- Inserts the item `i'  into list `o' in front of index `pos'.
			-- Returns 0 if successful; returns -1 and raises an exception if unsuccessful.
			-- Analogous to o.insert(pos, i).
		external
			"C | %"Python.h%""
		alias
			"PyList_Insert"
		end

	c_py_list_append (o, i: POINTER): INTEGER
			-- Appends the object item at the end of list list.
			-- Returns 0 if successful; returns -1 and sets an exception if unsuccessful.
			-- Analogous to o.append(i).
		external
			"C | %"Python.h%""
		alias
			"PyList_Append"
		end

	c_py_list_get_slice (o: POINTER; low, high: INTEGER): POINTER
			-- Return value: New reference.
			-- Returns a list of the objects in list containing the objects between low and high.
			-- Returns NULL and sets an exception if unsuccessful.
			-- Analogous to o[low:high].
		external
			"C | %"Python.h%""
		alias
			"PyList_GetSlice"
		end

	c_py_list_set_slice (o: POINTER; low, high: INTEGER; i: POINTER): INTEGER
			-- Sets the slice of list between low and high to the contents of itemlist `i'.
			-- Analogous to o[low:high] = i.
			-- Returns 0 on success, -1 on failure.
		external
			"C | %"Python.h%""
		alias
			"PyList_SetSlice"
		end

	c_py_list_sort (o: POINTER): INTEGER
			--  Sorts the items of list `o' in place.
			-- Returns 0 on success, -1 on failure.
			-- This is equivalent to "o.sort()".
		external
			"C | %"Python.h%""
		alias
			"PyList_Sort"
		end

	c_py_list_reverse (o: POINTER): INTEGER
			-- Reverses the items of list `o' in place.
			-- Returns 0 on success, -1 on failure.
			-- This is the equivalent of "o.reverse()".
		external
			"C | %"Python.h%""
		alias
			"PyList_Reverse"
		end

	c_py_list_as_tuple (o: POINTER): POINTER
			-- Return value: New reference.
			-- Returns a new tuple object containing the contents of list `o';
			-- equivalent to "tuple(o)".
		external
			"C | %"Python.h%""
		alias
			"PyList_AsTuple"
		end

feature {NONE} -- Externals (Module)

	c_py_module_type: POINTER
			-- This instance of PyTypeObject represents the Python module type.
			-- This is exposed to Python programs as types.ModuleType.
		external
			"C [macro %"Python.h%"]"
		alias
			"&PyModule_Type"
		end

	c_py_module_check (o: POINTER): INTEGER
			-- Returns true if `o'  is a module object, or a subtype of a module object.
			-- Changed in version 2.2: Allowed subtypes to be accepted.

		external
			"C [macro %"Python.h%"] (PyObject *): int"
		alias
			"PyModule_Check"
		end

	c_py_module_check_exact (o: POINTER): INTEGER
			-- Returns true if `o' is a module object, but not a subtype of PyModule_Type.
			-- New in version 2.2.
		external
			"C [macro %"Python.h%"] (PyObject *): int"
		alias
			"PyModule_CheckExact"
		end

	c_py_module_new (name: POINTER): POINTER
			-- Return value: New reference.
			-- Return a new module object with the __name__ attribute set to name.
			-- Only the module's __doc__ and __name__ attributes are filled in;
			-- the caller is responsible for providing a __file__ attribute.
		external
			"C | %"Python.h%""
		alias
			"PyModule_New"
		end

	c_py_module_get_dict (m: POINTER): POINTER
			-- Return value: Borrowed reference.
			-- Return the dictionary object that implements module's namespace;
			-- this object is the same as the __dict__ attribute of the module object.
			-- This function never fails.
		external
			"C | %"Python.h%""
		alias
			"PyModule_GetDict"
		end

	c_py_module_get_name (m: POINTER): POINTER
			-- Return module's __name__ value.
			-- If the module does not provide one, or if it is not a string, SystemError is raised and NULL is returned.
		external
			"C | %"Python.h%""
		alias
			"PyModule_GetName"
		end

	c_py_module_get_filename (m: POINTER): POINTER
			-- Return the name of the file from which module was loaded using module's __file__ attribute.
			-- If this is not defined, or if it is not a string, raise SystemError and return NULL.
		external
			"C | %"Python.h%""
		alias
			"PyModule_GetFilename"
		end

feature {NONE} -- Externals (None)

	c_py_none: POINTER
			-- The Python None object, denoting lack of value. This object has no methods.
			-- It needs to be treated just like any other object with respect to reference counts.
		external
			"C [macro %"Python.h%"]"
		alias
			"Py_None"
		end

feature {NONE} -- Externals (Object Protocol)

	c_py_object_type (o: POINTER): POINTER
			-- Return value:  New reference.
			-- When `o' is non-NULL, returns a type object corresponding to the object type of object `o'.
			-- On failure, raises SystemError and returns NULL.
			-- This is equivalent to the Python expression type(o)
		external
			"C | %"Python.h%""
		alias
			"PyObject_Type"
		end

	c_py_object_type_check (o, t: POINTER): INTEGER
			-- Return 1 if the object `o' is of type `t' or a subtype of `t'.
			-- Both parameters must be non-NULL. New in version 2.2.
		external
			"C [macro %"Python.h%"](PyObject*,PyTypeObject*):EIF_INTEGER"
		alias
			"PyObject_TypeCheck"
		end

	c_py_object_print (o, fp: POINTER; flags: INTEGER): INTEGER
			-- Print an object `o', on file `fp'. Returns -1 on error.
			-- The flags argument is used to enable certain printing options.
			-- The only option currently supported is Py_PRINT_RAW;
			-- if given, the str() of the object is written instead of the repr().
		external
			"C | %"Python.h%""
		alias
			"PyObject_Print"
		end

	c_py_object_has_attribute_string (o, a: POINTER): INTEGER
			-- Returns 1 if `o' has the attribute `a', and 0 otherwise.
			-- This is equivalent to the Python expression "hasattr(o, attr_name)".
			-- This function always succeeds.
		external
			"C | %"Python.h%""
		alias
			"PyObject_HasAttrString"
		end

	c_py_object_get_attribute_string (o, a: POINTER): POINTER
			-- Return value: New reference.
			-- Retrieve an attribute named `a' from object `o'.
			-- Returns the attribute value on success, or NULL on failure.
			-- This is the equivalent of the Python expression "o.a".
		external
			"C | %"Python.h%""
		alias
			"PyObject_GetAttrString"
		end

	c_py_object_set_attribute_string (o, a, v: POINTER): INTEGER
			-- Set the value of the attribute named `a' (char *), for object `o', to the value `v'.
			-- Returns -1 on failure.
			-- This is the equivalent of the Python statement "o.a = v".

		external
			"C | %"Python.h%""
		alias
			"PyObject_SetAttrString"
		end

	c_py_object_generic_set_attribute (o, a, v: POINTER): INTEGER
			-- Generic attribute setter and deleter function that is meant to be put into a type object’s tp_setattro slot.
			-- It looks for a data descriptor in the dictionary of classes in the object’s MRO, and if found it takes preference over setting or deleting the attribute in the instance dictionary.
			-- Otherwise, the attribute is set or deleted in the object’s __dict__ (if present). On success, 0 is returned, otherwise an AttributeError is raised and -1 is returned.
		external
			"C | %"Python.h%""
		alias
			"PyObject_GenericSetAttr"
		end

	c_py_object_generic_get_dictionary (o, context: POINTER): POINTER
			--Return value: New reference.
			--A generic implementation for the getter of a __dict__ descriptor. It creates the dictionary if necessary.
		external
			"C inline use <Python.h>"
		alias
			"return PyObject_GenericGetDict((PyObject *)$o, (void *)$context)"
		end

	c_py_object_generic_set_dictionary (o, v, c: POINTER): POINTER
			-- A generic implementation for the setter of a __dict__ descriptor.
			-- This implementation does not allow the dictionary to be deleted.
		external
			"C inline use <Python.h>"
		alias
			"return PyObject_GenericSetDict((PyObject *)$o, (PyObject *)$v, (void *)$c)"
		end

	c_py_object_del_attribute_string (o, a: POINTER): INTEGER
			-- Delete attribute named `a' (char *), for object `o'.
			-- Returns -1 on failure.
			-- This is the equivalent of the Python statement: "del o.a".
		external
			"C [macro %"Python.h%"] (PyObject*, char*): EIF_INTEGER"
		alias
			"PyObject_DelAttrString"
		end

	c_py_object_has_attribute (o, a: POINTER): INTEGER
			-- Returns 1 if `o' has the attribute `a' of type char *, and 0 otherwise.
			-- This is equivalent to the Python expression "hasattr(o, a)".
			-- This function always succeeds.
		external
			"C | %"Python.h%""
		alias
			"PyObject_HasAttr"
		end

	c_py_object_get_attribute (o, a: POINTER): POINTER
			-- Retrieve an attribute named `a' from object `o'.
			-- Returns the attribute value on success, or NULL on failure.
			-- This is the equivalent of the Python expression "o.attr_name".
		external
			"C | %"Python.h%""
		alias
			"PyObject_GetAttr"
		end

	c_py_object_set_attribute (o, a, v: POINTER): INTEGER
			-- Set the value of the attribute named `a', for object `o', to the value `v'.
			-- Returns -1 on failure.
			-- This is the equivalent of the Python statement "o.a = v".

		external
			"C | %"Python.h%""
		alias
			"PyObject_SetAttr"
		end

	c_py_object_del_attribute (o, a: POINTER): INTEGER
			-- Delete attribute named `a', for object `o'.
			-- Returns -1 on failure.
			-- This is the equivalent of the Python statement: "del o.a".
		external
			"C [macro %"Python.h%"] (PyObject*, PyObject*): EIF_INTEGER"
		alias
			"PyObject_DelAttr"
		end

	c_py_object_generic_get_attribute (o, a: POINTER): INTEGER
			-- Return value: New reference.
			-- Generic attribute getter function that is meant to be put into a type object’s tp_getattro slot.
			-- It looks for a descriptor in the dictionary of classes in the object’s MRO as well as an attribute in the object’s __dict__ (if present).
			-- As outlined in Implementing Descriptors, data descriptors take preference over instance attributes, while non-data descriptors don’t.
			--  Otherwise, an AttributeError is raised.
		external
			"C [macro %"Python.h%"] (PyObject*, PyObject*): EIF_POINTER"
		alias
			"PyObject_GenericGetAttr"
		end

	c_py_object_compare_cmp (o1, o2: POINTER): INTEGER
			-- Compare the values of `o1' and `o2' using a routine provided by `o1',
			-- if one exists, otherwise with a routine provided by `o2'.
			-- Returns the result of the comparison on success.
			-- On error, the value returned is undefined; use PyErr_Occurred() to detect an error.
			-- This is equivalent to the Python expression "cmp(o1, o2)".
		external
			"C inline use <Python.h>"
		alias
			"(($o1 > $o2) - ($o1 < $o2)) "
		end

	c_py_object_cmp, c_py_object_rich_compare (o1, o2: POINTER; opid: INTEGER): POINTER
			-- Compare the values of `o1` and `o2` using the operation specified by opid.
			-- which must be one of Py_LT, Py_LE, Py_EQ, Py_NE, Py_GT, or Py_GE, corresponding to <, <=, ==, !=, >, or >= respectively.
			-- This is the equivalent of the Python expression `o1 op o2`, where op is the operator corresponding to opid. Returns the value of the comparison on success, or NULL on failure.
		external
			"C | %"Python.h%""
		alias
			"PyObject_RichCompare"
		end

	c_py_object_compare, c_py_object_rich_compare_bool (o1, o2: POINTER; opid: INTEGER): INTEGER
			-- Compare the values of o1 and o2 using the operation specified by opid, which must be one of Py_LT, Py_LE, Py_EQ, Py_NE, Py_GT, or Py_GE, corresponding to <, <=, ==, !=, >, or >= respectively.
			-- Returns -1 on error, 0 if the result is false, 1 otherwise. This is the equivalent of the Python expression o1 op o2, where op is the operator corresponding to opid.
		external
			"C | %"Python.h%""
		alias
			"PyObject_RichCompareBool"
		end

	c_py_object_repr (o: POINTER): POINTER
			-- Return value:  New reference.
			-- Compute a string representation of object `o'.
			-- Returns the string representation on success, NULL on failure.
			-- This is the equivalent of the Python expression "repr(o)".
			-- Called by the repr() built-in function and by reverse quotes.
			-- Changed in version 3.4: This function now includes a debug assertion to help ensure that it does not silently discard an active exception.
		external
			"C | %"Python.h%""
		alias
			"PyObject_Repr"
		end

	c_py_object_ascii (o: POINTER): POINTER
			--Return value: New reference.
			--As PyObject_Repr(), compute a string representation of object o, but escape the non-ASCII characters in the string returned by PyObject_Repr() with \x, \u or \U escapes.
			-- This generates a string similar to that returned by PyObject_Repr() in Python 2. Called by the ascii() built-in function.
		external
			"C | %"Python.h%""
		alias
			"PyObject_ASCII"
		end

	c_py_object_str (o: POINTER): POINTER
			-- Return value:  New reference.
			-- Compute a string representation of object `o'.
			-- Returns the string representation on success, NULL on failure.
			-- This is the equivalent of the Python expression "str(o)".
			-- Called by the str() built-in function and by the print statement.
		external
			"C | %"Python.h%""
		alias
			"PyObject_Str"
		end

	c_py_object_bytes (o: POINTER): POINTER
			-- Return value: New reference.
			-- Compute a bytes representation of object o.
			-- NULL is returned on failure and a bytes object on success.
			-- This is equivalent to the Python expression bytes(o), when o is not an integer.
			-- Unlike bytes(o), a TypeError is raised when o is an integer instead of a zero-initialized bytes object.	
		external
			"C | %"Python.h%""
		alias
			"PyObject_Bytes"
		end

	c_py_object_is_subclass (o, c: POINTER): INTEGER
			-- Return 1 if the class `o` is identical to or derived from the class `c`, otherwise return 0. In case of an error, return -1.
			-- If `c` is a tuple, the check will be done against every entry in cls.
			-- The result will be 1 when at least one of the checks returns 1, otherwise it will be 0.
			-- If `c` has a __subclasscheck__() method, it will be called to determine the subclass status as described in PEP 3119. Otherwise, derived is a subclass of `c` if it is a direct or indirect subclass, i.e. contained in a.__mro__.
			-- Normally only class objects, i.e. instances of type or a derived class, are considered classes. However, objects can override this by having a __bases__ attribute (which must be a tuple of base classes).		
		external
			"C | %"Python.h%""
		alias
			"PyObject_IsSubclass"
		end

	c_py_object_is_instance (o, c: POINTER): INTEGER
			-- Return 1 if `o` is an instance of the class `c` or a subclass of `c`, or 0 if not. On error, returns -1 and sets an exception.
			-- If `c` is a tuple, the check will be done against every entry in `c`. The result will be 1 when at least one of the checks returns 1, otherwise it will be 0.
            -- If `c` has a __instancecheck__() method, it will be called to determine the subclass status as described in PEP 3119. Otherwise, `o` is an instance of `c` if its class is a subclass of `c`.
			-- An instance `o` can override what is considered its class by having a __class__ attribute.
			--  An object `c` can override if it is considered a class, and what its base classes are, by having a __bases__ attribute (which must be a tuple of base classes).
		external
			"C | %"Python.h%""
		alias
			"PyObject_IsInstance"
		end

	c_py_object_call_object (o, a: POINTER): POINTER
			-- Return value: New reference.
			-- Call a callable Python object `o', with arguments given by the tuple `a'.
			-- If no arguments are needed, then args may be NULL.
			-- Returns the result of the call on success, or NULL on failure.
			-- This is the equivalent of the Python expression "apply(o, a)" or "o(*a)".
		external
			"C | %"Python.h%""
		alias
			"PyObject_CallObject"
		end

	c_py_object_call_function (o, f, a: POINTER): POINTER
			-- Return value: New reference.
			-- Call a callable Python object `o', with a variable number of C arguments.
			-- The C arguments are described using a Py_BuildValue() style format string `f'.
			-- The format may be NULL, indicating that no arguments are provided.
			-- Returns the result of the call on success, or NULL on failure.
			-- This is the equivalent of the Python expression "apply(callable, args)" or "callable(*args)".
		external
			"C | %"Python.h%""
		alias
			"PyObject_CallFunction"
		end

	c_py_object_call_method (o, m, f, a: POINTER): POINTER
			-- Return value: New reference.
			-- Call the method named `m' of object `o' with a variable number of C arguments.
			-- The C arguments are described by a Py_BuildValue() format string `f'.
			-- The format may be NULL, indicating that no arguments are provided.
			-- Returns the result of the call on success, or NULL on failure.
			-- This is the equivalent of the Python expression "o.method(a)".
		external
			"C | %"Python.h%""
		alias
			"PyObject_CallMethod"
		end

	c_py_object_hash (o: POINTER): INTEGER
			-- Compute and return the hash value of an object `o'.
			-- On failure, return -1.
			-- This is the equivalent of the Python expression "hash(o)".
		external
			"C | %"Python.h%""
		alias
			"PyObject_Hash"
		end

	c_py_object_hash_not_implemented (o: POINTER): INTEGER
			-- Set a TypeError indicating that type(o) is not hashable and return -1.
			-- This function receives special treatment when stored in a tp_hash slot, allowing a type to explicitly indicate to the interpreter that it is not hashable.
		external
			"C | %"Python.h%""
		alias
			"PyObject_Hash"
		end


	c_py_object_is_true (o: POINTER): INTEGER
			-- Returns 1 if the object `o' is considered to be true, and 0 otherwise.
			-- This is equivalent to the Python expression "not not o".
			-- This function always succeeds.
		external
			"C | %"Python.h%""
		alias
			"PyObject_IsTrue"
		end

	c_py_object_not (o: POINTER): INTEGER
			-- Returns 0 if the object o is considered to be true, and 1 otherwise.
			-- This is equivalent to the Python expression not o. On failure, return -1.	
		external
			"C | %"Python.h%""
		alias
			"PyObject_Not"
		end

	c_py_object_length (o: POINTER): INTEGER
			-- Return the length of object `o'.
			-- If the object `o' provides both sequence and mapping protocols,
			-- the sequence length is returned.
			-- On error, -1 is returned.
			-- This is the equivalent to the Python expression "len(o)".
		external
			"C | %"Python.h%""
		alias
			"PyObject_Length"
		end

	c_py_object_size (o: POINTER): INTEGER
			-- Return the length of object o.
			-- If the object o provides either the sequence and mapping protocols, the sequence length is returned.
			--On error, -1 is returned.
			-- This is the equivalent to the Python expression len(o).		
		external
			"C | %"Python.h%""
		alias
			"PyObject_Size"
		end

	c_py_object_length_hint (o: POINTER; a_default: INTEGER): INTEGER
			-- Return an estimated length for the object o.
			-- First try to return its actual length, then an estimate using __length_hint__(), and finally return the default value.
			-- On error return -1.
			-- This is the equivalent to the Python expression operator.length_hint(o, a_default).
			-- New in version 3.4.
		external
			"C inline use <Python.h>"
		alias
			"return PyObject_LengthHint((PyObject *)$o, (Py_ssize_t)$a_default)"
		end

	c_py_object_get_item (o, k: POINTER): POINTER
			-- Return value: New reference.
			-- Return element of `o' corresponding to the object `k'  or NULL on failure.
			-- This is the equivalent of the Python expression "o[k]".
		external
			"C | %"Python.h%""
		alias
			"PyObject_GetItem"
		end

	c_py_object_set_item (o, k, v: POINTER): INTEGER
			-- Map the object `k' to the value `v'.
			-- Returns -1 on failure.
			-- This is the equivalent of the Python statement "o[k] = v".

		external
			"C | %"Python.h%""
		alias
			"PyObject_SetItem"
		end

	c_py_object_del_item (o, k: POINTER): INTEGER
			-- Delete the mapping for `k' from `o'.
			-- Returns -1 on failure.
			-- This is the equivalent of the Python statement "del o[k]".
		external
			"C | %"Python.h%""
		alias
			"PyObject_DelItem"
		end

	c_py_object_as_file_descriptor (o: POINTER): INTEGER
			-- Derives a file-descriptor from a Python object.
			-- If the object is an integer or long integer, its value is returned.
			-- If not, the object's fileno() method is called if it exists;
			-- the method must return an integer or long integer,
			-- which is returned as the file descriptor value.
			-- Returns -1 on failure.
		external
			"C | %"Python.h%""
		alias
			"PyObject_AsFileDescriptor"
		end

	c_py_object_dir (o: POINTER)
			-- Return value: New reference.
			-- This is equivalent to the Python expression "dir(o)",
			-- returning a (possibly empty) list of strings appropriate for the object argument,
			-- or NULL if there was an error.
			-- If the argument is NULL, this is like the Python "dir()",
			-- returning the names of the current locals; in this case,
			-- if no execution frame is active then NULL is returned but PyErr_Occurred() will return false.
		external
			"C | %"Python.h%""
		alias
			"PyObject_Dir"
		end

	c_py_object_get_iter (o: POINTER): POINTER
			--This is equivalent to the Python expression "iter(o)".
			-- It returns a new iterator for the object argument,
			-- or the object itself if the object is already an iterator.
			-- Raises TypeError and returns NULL if the object cannot be iterated.
		external
			"C | %"Python.h%""
		alias
			"PyObject_GetIter"
		end

	c_py_callable_check (o: POINTER): INTEGER
			-- Determine if the object `o' is callable.
			-- Return 1 if the object is callable and 0 otherwise.
			-- This function always succeeds.
		external
			"C | %"Python.h%""
		alias
			"PyCallable_Check"
		end

feature {NONE} -- Externals (Sequence protocol)

	c_py_sequence_check (o: POINTER): INTEGER
			-- Return 1 if the object provides sequence protocol, and 0 otherwise.
			-- This function always succeeds.
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PySequence_Check"
		end

	c_py_sequence_size (o: POINTER): INTEGER
			-- Returns the number of objects in sequence o on success, and -1 on failure.
			-- For objects that do not provide sequence protocol, this is equivalent to the Python expression "len(o)".
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PySequence_Size"
		end

	c_py_sequence_contains (o, value: POINTER): INTEGER
			-- Determine if `o' contains `value'.
			-- If an item in `o' is equal to `value', return 1, otherwise return 0.
			-- On error, return -1. This is equivalent to the Python expression "value in o".
		external
			"C [macro %"Python.h%"](PyObject*,PyTypeObject*):EIF_INTEGER"
		alias
			"PySequence_Contains"
		end

	c_py_sequence_get_item (o: POINTER; pos: INTEGER): POINTER
			-- Return value: Borrowed reference.
			-- Returns the object at position `pos' in the sequence pointed to by `o'.
			-- This is the equivalent of the Python expression "o[pos]".
			-- If `pos' is out of bounds, returns NULL and sets an IndexError exception.
		external
			"C | %"Python.h%""
		alias
			"PySequence_GetItem"
		end

	c_py_sequence_set_item (o: POINTER; pos: INTEGER; v: POINTER): INTEGER
			-- Assign object v to the pos element of o.
			-- Returns -1 on failure.
			-- This is the equivalent of the Python statement "o[i] = v".
			-- This function does not  steal a reference to v.
		external
			"C | %"Python.h%""
		alias
			"PySequence_SetItem"
		end

feature {NONE} -- Externals (String Objects)

		--	c_py_string_type: POINTER
		--			--  This instance of PyTypeObject represents the Python string type;
		--			-- it is the same object as types.TypeType in the Python layer.
		--		external
		--			"C [macro %"Python.h%"]"
		--		alias
		--			"&PyString_Type"
		--		end

		--	c_py_string_from_string (s: POINTER): POINTER
		--			-- Return value:  New reference.
		--			-- Returns a new string object with the value `s' on success,
		--			-- and NULL on failure. The parameter `s' must not be NULL;
		--			-- it will not be checked.
		--		external
		--			"C | %"Python.h%""
		--		alias
		--			"PyString_FromString"
		--		end

		--	c_py_string_check (o: POINTER): INTEGER
		--			--Returns true if the object `o' is a string object or
		--			-- an instance of a subtype of the string type.
		--			-- Changed in version 2.2: Allowed subtypes to be accepted.
		--		external
		--			"C [macro %"Python.h%"] (PyObject *): int"
		--		alias
		--			"PyString_Check"
		--		end

		--	c_py_string_check_exact (o: POINTER): INTEGER
		--			-- Returns true if the object `o' is a string object,
		--			-- but not an instance of a subtype of the string type. New in version 2.2.
		--		external
		--			"C [macro %"Python.h%"](PyObject *): int"
		--		alias
		--			"PyString_CheckExact"
		--		end

		--	c_py_string_from_string_and_size (s: POINTER; len: INTEGER): POINTER
		--			-- Return value: New reference.
		--			-- Returns a new string object with the value `s' and length len on success,
		--			-- and NULL on failure. If `o' is NULL, the contents of the string are uninitialized.
		--		external
		--			"C | %"Python.h%""
		--		alias
		--			"PyString_FromStringAndSize"
		--		end

		--	c_py_string_size (o: POINTER): INTEGER
		--			-- Returns the length of the string in string object string.
		--		external
		--			"C | %"Python.h%""
		--		alias
		--			"PyString_Size"
		--		end

		--	c_py_string_as_string (s: POINTER): POINTER
		--			-- Returns a NUL-terminated representation of the contents of string.
		--			-- The pointer refers to the internal buffer of string, not a copy.
		--			-- The data must not be modified in any way,
		--			-- unless the string was just created using PyString_FromStringAndSize(NULL, size).
		--			-- It must not be deallocated.
		--			-- If string is a Unicode object, this function computes the default encoding of string and operates on that.
		--			-- If string is not a string object at all, PyString_AsString() returns NULL and raises TypeError.
		--		external
		--			"C | %"Python.h%""
		--		alias
		--			"PyString_AsString"
		--		end

		--	c_py_string_format (f: POINTER; args: INTEGER): POINTER
		--			-- Return value: New reference.
		--			-- Returns a new string object from `f' and `args'.
		--			-- Analogous to format % `args'.
		--			-- The `args' argument must be a tuple.
		--		external
		--			"C | %"Python.h%""
		--		alias
		--			"PyString_Format"
		--		end

		--	c_py_string_decode (s: POINTER; size: INTEGER; encoding, errors: POINTER): POINTER
		--			-- Return value: New reference.
		--			-- Creates an object by decoding `size' bytes of the encoded buffer `s'
		--			-- using the codec registered for `encoding'.
		--			-- `encoding' and `errors' have the same meaning as the parameters of the same name in the unicode() built-in function.
		--			-- The codec to be used is looked up using the Python codec registry.
		--			-- Returns NULL if an exception was raised by the codec.
		--		external
		--			"C | %"Python.h%""
		--		alias
		--			"PyString_Decode"
		--		end

		--	c_py_string_encode (s: POINTER; size: INTEGER; encoding, errors: POINTER): POINTER
		--			-- Return value: New reference.
		--			-- Encodes the char buffer `s' of the given `size'
		--			-- by passing it to the codec registered for encoding and returns a Python object.
		--			-- `encoding' and `errors' have the same meaning as the parameters of the same name in the string encode() method.
		--			-- The codec to be used is looked up using the Python codec registry.
		--			-- Returns NULL if an exception was raised by the codec.
		--		external
		--			"C | %"Python.h%""
		--		alias
		--			"PyString_Encode"
		--		end

feature {NONE} -- Externals (Tuple Objects)

	c_py_tuple_type: POINTER
			-- This instance of PyTypeObject represents the Python tuple type;
			-- it is the same object as types.TupleType in the Python layer.
		external
			"C [macro %"Python.h%"]"
		alias
			"&PyTuple_Type"
		end

	c_py_tuple_check (o: POINTER): INTEGER
			-- Return true if p is a tuple object or an instance of a subtype of the tuple type.
			-- Changed in version 2.2: Allowed subtypes to be accepted.
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PyTuple_Check"
		end

	c_py_tuple_new (l: INTEGER): POINTER
			-- Return value: New reference.
			-- Returns a new tuple of size `l' on success, or NULL on failure.
		external
			"C | %"Python.h%""
		alias
			"PyTuple_New"
		end

	c_py_tuple_size (o: POINTER): INTEGER
			-- Returns the length of the tuple object in `o';
			-- this is equivalent to "len(o)" on a tuple object.
		external
			"C | %"Python.h%""
		alias
			"PyList_Size"
		end

	c_py_tuple_get_item (o: POINTER; pos: INTEGER): POINTER
			-- Return value:  Borrowed reference.
			-- Returns the object at position pos in the tuple pointed to by o.
			-- If pos is out of bounds, returns NULL and sets an IndexError exception.
		external
			"C | %"Python.h%""
		alias
			"PyTuple_GetItem"
		end

	c_py_tuple_set_item (o: POINTER; pos: INTEGER; v: POINTER): INTEGER
			-- Inserts a reference to object v at position pos of the tuple pointed to by o.
			-- It returns 0 on success. Note: This function ``steals'' a reference to v.
		external
			"C | %"Python.h%""
		alias
			"PyTuple_SetItem"
		end

feature {NONE} -- Externals (Type Objects)

	c_py_type_type: POINTER
			-- This is the type object for type objects;
			-- it is the same object as types.TypeType in the Python layer.
		external
			"C [macro %"Python.h%"]"
		alias
			"&PyType_Type"
		end

	c_py_type_is_subtype (a, b: POINTER): INTEGER
			-- Return true if a is a subtype of b. New in version 2.2.
		external
			"C | %"Python.h%""
		alias
			"PyType_IsSubtype"
		end

	c_py_type_check (o: POINTER): INTEGER
			-- Return non-zero if the object o is a type object, including instances of types derived from the standard type object.
			-- Return 0 in all other cases.
		external
			"C [macro %"Python.h%"] (PyObject *): int"
		alias
			"PyType_Check"
		end

	c_py_type_checkexact (o: POINTER): INTEGER
			-- Return non-zero if the object o is a type object, but not a subtype of the standard type object.
			-- Return 0 in all other cases.
		external
			"C [macro %"Python.h%"] (PyObject *): int"
		alias
			"PyType_CheckExact"
		end

feature {NONE} -- Externals (	 Objects)

	c_py_unicode_type: POINTER
			--
		external
			"C [macro %"Python.h%"]"
		alias
			"&PyUnicode_Type"
		end

end -- class PYTHON_API
