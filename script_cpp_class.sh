#!/bin/bash

read -p 'Nom de la classe: ' class
echo "#ifndef `echo $class | tr [a-z] [A-Z]`_HPP
# define `echo $class | tr [a-z] [A-Z]`_HPP

# include <string>

class $class {

public:

	$class(void);
	$class(std::string name, int const n);
	$class($class const & src);
	virtual ~$class();

	$class &	operator=($class const & rhs);

	int			get_n(void) const;
	std::string	get_name(void) const;
	
private:

	std::string	_name;
	int			_n;

};

std::ostream &		operator<<(std::ostream & o, $class const & rhs);

#endif" > $class.hpp

echo "#include \"$class.hpp\"
#include <iostream>

/*************************     CONSTRUCTORS     *******************************/

$class::$class(void) {

	std::cout << \"Default constructor called\" << std::endl;
	return ;
}

$class::$class(std::string name, int const n) : _name(name), _n(n) {
	return ;
}

$class::$class($class const & src) {

	std::cout << \"Copy constructor called\" << std::endl;
	*this = src;

	return ;
}

/*************************     DESTRUCTORS     ********************************/

$class::~$class(void) {
	std::cout << \"Destructor called\" << std::endl;
}

/*************************     OPERATORS OVERLOAD     *************************/

$class &	$class::operator=($class const & rhs) {

	std::cout << \"Assignation operator called\" << std::endl;
	if (this != &rhs) {
		this->_n = rhs.get_n();
		this->_name = rhs.get_name();
	}
	
	return *this;
}

/*************************     GETTERS      ***********************************/

/*************************     SETTERS      ***********************************/

/*************************     PUBLIC MEMBER FUNCTIONS      *******************/

std::string	$class::get_name(void) const {
	return (this->_name);
}

int			$class::get_n(void) const {
	return (this->_n);
}

/*************************     PRIVATE MEMBER FUNCTIONS     *******************/

/*************************     NON MEMBER FUNTIONS     ************************/
/*************************     EXTERNAL OVERLOADS     *************************/

std::ostream &		operator<<(std::ostream & o, $class const & rhs) {
	o << rhs.get_name();

	return (o);
}

" > $class.cpp
