<?php

namespace Models\Tutorat\Model;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;


class Moduleenseignier implements InputFilterAwareInterface
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
			'name'       => 'idmoduleenseignier',
			'required'   => true,
			'filters' => array(
			array('name'    => 'Int'),
			),
			)));
			            $inputFilter->add($factory->createInput(array(
			'name'       => 'iddiplomeensegnier',
			'required'   => true,
			'filters' => array(
			array('name'    => 'Int'),
			),
			)));
			            $inputFilter->add($factory->createInput(array(
			'name'     => 'modulenom',
			'required' => false,
			'filters'  => array(
			array('name' => 'StripTags'),
			array('name' => 'StringTrim'),
			),
				)));
				            $inputFilter->add($factory->createInput(array(
			'name'     => 'descmoduleens',
			'required' => false,
			'filters'  => array(
			array('name' => 'StripTags'),
			array('name' => 'StringTrim'),
			),
				)));
				            $inputFilter->add($factory->createInput(array(
			'name'     => 'competencemodule',
			'required' => false,
			'filters'  => array(
			array('name' => 'StripTags'),
			array('name' => 'StringTrim'),
			),
				)));
				            $inputFilter->add($factory->createInput(array(
			'name'     => 'domainemoduleens',
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