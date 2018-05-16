<?php
declare(strict_types = 1);
/**
 * ZF2rapid skeleton application
 *
 * @package    Application
 * @link       https://github.com/ZFrapid/zf2rapid-skeleton
 * @copyright  Copyright (c) 2014 - 2016 Ralf Eggert
 * @license    http://opensource.org/licenses/MIT The MIT License (MIT)
 */

/**
 * Application module translations
 *
 * @package    Application
 */
return [

    //Menu Arabe CV
    'Menu_CV_Titre_InfoGenerale'=>'معطيات عامة خاصة بالملف الإداري',
    'Menu_CV_Titre_InfoProfissionnel'=>'معطيات المهنية',
    'Menu_CV_Coordonnee'=>'معطيات الإتصال',
    'Menu_CV_InformationPro'=>'معطيات المهنية',
    'Menu_CV_InformationPersonnel'=>'معطيات الشخصية',
    'Menu_CV_Etablissement_Enseigne'=>' مؤسسات التدريس',
    'Menu_CV_Mes_Travaux'=>'الأعمال الخاصة',
    'Menu_CV_Specialite'=>'التخصوصات',
    'Menu_CV_Compte'=>'حسابي الشخصي',
    'Menu_CV_Titre_DiplomeEns'=>'أعلى شهادة علمية',
    'Menu_CV_Titre_DossierDepot'=>'إداع الملف الإداري',
    'Menu_CV_Titre_Depotimageprofile'=>'صورة الشخصية',
    'Menu_CV_Titre_Imprimerdemande'=>'طباعة مطلب سعات التدريس',
    //Titre des pages
   'Creation_Ens_Travail'=>'أضف المحتوى ',

    ////diplome ens
    'save_diplomeens'=>'تسجيل',
    'diplomeens_label_specialiterdiplome'=>'الاختصاص',
    'diplomeens_label_dateobtention'=>'سنة الحصول على الشهادة',
    'diplomeens_label_etablissement'=>'المأسسة',
    'diplomeens_label_pays'=>'البلد',
    'diplomeens_label_titrediplome'=>'أعلى شهادة علمية ',
    //enseignant

    'enseignants_title_infopersonnel_legende'=>'معطيات شخصية',
    'enseignants_title_index' => 'Enseignants overview',
    'enseignants_title_show' => 'Enseignants view',
    'enseignants_title_create' => 'معطيات شخصية',
    'enseignants_title_update' => 'Mise à jour des données d\'Enseignant',
    'enseignants_title_delete' => 'Enseignants delete',

    'enseignants_legende_Identiter'=>"المعرفات",
    'enseignants_label_civilite'=>'الجنس',
    'enseignants_navigation_index' => 'Enseignants',
    'enseignants_navigation_show' => 'Enseignants view',
    'enseignants_navigation_create' => 'Enseignants create',
    'enseignants_navigation_update' => 'Enseignants update',
    'enseignants_navigation_delete' => 'Enseignants delete',
    'enseignants_action_index' => 'Enseignants overview',
    'enseignants_action_show' => 'Show Enseignants',
    'enseignants_action_save' => 'Save Enseignants',
    'enseignants_action_create' => 'Create Enseignants',
    'enseignants_action_update' => 'Update Enseignants',
    'enseignants_action_delete' => 'Delete Enseignants',
    'enseignants_label_idpersonnes' => 'Idpersonnes',
    'enseignants_label_cin' =>'بطا قة التعريف',
    'enseignants_label_livrerle' =>  'المسلمة في ',

    'enseignants_label_matricule' =>'المعرف الوحيد ',
    'enseignants_label_type_matricule'=>'نوع المعرف الوحيد ',
    'enseignants_label_tel_fix'=>'الهاتف القار',
    'enseignants_label_tel_mobile'=>'المحمول',
    'enseignants_label_email' =>'العنوان الإلكتروني',
    'enseignants_label_datedenaissance' =>'تاريخ الولادة ',
    'enseignants_label_lieudenaissance' =>'مكان الولادة',
    'enseignants_label_proffision' =>'الوظيفة الأساسية',
    'enseignants_label_entreprise' =>'المؤسسة الأصلية ',
    'enseignants_label_grade' =>'الرتبة ',
    'enseignants_label_rib' =>'رقم الحساب الجاري ',
    'enseignants_label_dernierdip' =>'أعلى شهادة علمية ',
    'enseignants_label_dernierspecialite' => 'الاختصاص ',

    'enseignants_label_ville'=>'مدينة',
    'enseignants_label_adress'=>'العنوان',
    'enseignants_label_pays'=> 'البلد',
    'enseignants_label_codepostal'=>'الرقم البريدي',

    'enseignants_message_enseignants_not_found' => 'No Enseignants found.',
    'enseignants_message_enseignants_data_invalid' => 'Enseignants data invalid. Please check your input.',
    'enseignants_message_enseignants_saving_success' => 'Enseignants was saved.',
    'enseignants_message_enseignants_saving_failed' => 'Enseignants could not be saved.',
    'enseignants_message_enseignants_deleting_possible' => 'You can delete the Enseignants now.',
    'enseignants_message_enseignants_deleting_success' => 'Enseignants was deleted.',
    'enseignants_message_enseignants_deleting_failed' => 'Enseignants could not be deleted.',
    'enseignants_message_enseignants_idpersonnes_stringlength' => 'Wrong length for enseignants idpersonnes!',
    'enseignants_message_enseignants_idpersonnes_notempty' => 'Idpersonnes should not be empty!',
    'enseignants_message_enseignants_rib_stringlength' => 'Wrong length for enseignants rib!',
    'enseignants_message_enseignants_rib_notempty' => 'Rib should not be empty!',
     ///information arabe
    'enseignants_label_nom'=>'الإسم',
    'enseignants_label_prenom'=>'القب',

    ///message grade
    'grade_message_aide_titre'=>'جميع المعلومات...',


    ///InfoProEns


    'InfoProEns_label_fonction'=>'المهام ',
    'InfoProEns_label_societer'=>'المؤسسة الأصلية ',
    'InfoProEns_label_daterecrutement'=>'تاريخ الإنتداب',
    'InfoProEns_label_datefin'=>'تاريخ نهايت العمل',
    'InfoProEns_label_descposte'=>'تفسير',
    'InfoProEns_label_ville'=>'مدينة',
    'InfoProEns_label_pays'=>'البلد',
    'InfoProEns_label_telephonepro'=>'الهاتف',
    'InfoProEns_label_grade'=>'الرتبة ',
    'InfoProEns_label_poste'=>'الوظيفة الأساسية',

];