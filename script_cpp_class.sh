#!/bin/bash

read -p 'Nom de la classe: ' class
echo "#ifndef `echo $class | tr [a-z] [A-Z]`_HPP
# define `echo $class | tr [a-z] [A-Z]`_HPP

class $class {

public:

	$class(void);
	$class(int const n);
	$class($class const & src);
	~$class();

	$class &	operator=($class const & rhs)
	int			get_n(void) const;
	
private:

	int			_n;

};

#endif" >> $class.hpp

echo "#include \"$class.hpp\"

$class::$class(void) {
	return ;
}

$class::$class(int const n) : _n(n) {
	return ;
}

$class::$class($class const & src) {

	*this = src

	return ;
}

$class::~$class(void) {}

$class &	$class::operator=($class const & rhs) {

	if (this != &rhs)
		this->_n = rhs->get_n();
	
	return *this;
}

int			$class::get_n(void) {
	return (this->_n);
}
" >> $class.cpp
