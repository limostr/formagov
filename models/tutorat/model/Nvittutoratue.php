<?php

namespace Models\Tutorat\Model;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;


class Nvittutoratue implements InputFilterAwareInterface
{
    protected $inputFilter;

    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new \Exception("Not used");
    }

    public function getInputFilter()
    {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();

            $factory = new InputFactory();
            
            $inputFilter->add($factory->createInput(array(
			'name'       => 'idinvitations',
			'required'   => true,
			'filters' => array(
			array('name'    => 'Int'),
			),
			)));
			            $inputFilter->add($factory->createInput(array(
			'name'       => 'idModule',
			'required'   => true,
			'filters' => array(
			array('name'    => 'Int'),
			),
			)));
			            $inputFilter->add($factory->createInput(array(
			'name'     => 'statusinvtvalid',
			'required' => true,
			'filters'  => array(
			array('name' => 'StripTags'),
			array('name' => 'StringTrim'),
			),
			'validators' => array(
			array(
			'name'    => 'StringLength',
			'options' => array(
			'encoding' => 'utf8',
			'min'      => 1,
			'max'      => 45,
				),
				),
				),
				)));
				            $inputFilter->add($factory->createInput(array(
			'name'     => 'datereponse',
			'required' => false,
			'filters'  => array(
			array('name' => 'StripTags'),
			array('name' => 'StringTrim'),
			),
				)));
				 

            $this->inputFilter = $inputFilter;        
        }

        return $this->inputFilter;
    }
}