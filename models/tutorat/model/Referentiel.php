<?php

namespace Models\Tutorat\Model;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;


class Referentiel implements InputFilterAwareInterface
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
			'name'       => 'idobjective',
			'required'   => true,
			'filters' => array(
			array('name'    => 'Int'),
			),
			)));
			            $inputFilter->add($factory->createInput(array(
			'name'       => 'idformations',
			'required'   => true,
			'filters' => array(
			array('name'    => 'Int'),
			),
			)));
			 

            $this->inputFilter = $inputFilter;        
        }

        return $this->inputFilter;
    }
}