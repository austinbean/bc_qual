* birth cert quality
* how good is that data?

* Do aggregate level at the state first, then w/in hospital.  
* Potentially by patient chars.

/*
https://www.cdc.gov/nchs/data/dvs/birth11-03final-ACC.pdf

Might as well check everything...
This should take as input a long table of Pat ID, ICD-9
*/

	* Infant Characteristics
	
// Year of Birth 

// Month of Birth

// Sex 1 Male 0 Female
	* this can be inferred from inpatient.

// Place of Birth - County

// City or Town

// Plurality

// Place of Birth

// Name of Hospital or Birthing Center

	* Mother's characteristics

// Mother's Residence Zip Code

// Mother's Education

// Hispanic Origin? No, Not Spanish, Hispanic/Latina
// Hispanic Origin? Mexican, Mexican American, Chicana
// Hispanic Origin? Puerto Rican
// Hispanic Origin? Cuban
// Hispanic Origin? Other Spanish, Hispanic/Latina
// Hispanic Origin? Other (Specify)
// Mother of Hispanic Origin:  Unknown

// Mother White

// Mother Black or African American

// Mother American Indian or Alaska Native 
// Mother American Indian or Alaska Native (Name of tribe)

// Mother Asian Indian
// Mother Chinese
// Mother Filipino
// Mother Japanese
// Mother Korean
// Mother Vietnamese
// Mother Other Asian
// Mother Other Asian (Specify)

// Mother Native Hawaiian
// Mother Guamanian or Chamorro
// Mother Samoan
// Mother Other Pacific Islander 
// Mother Other Pacific Islander (Specify)
// Mother Other 
// Mother Other (Specify)

// Mother's Race:  Unknown


	* Prenatal Care

// Prenatal Care Y/N

// Prenatal Care Date of First Visit (mm/dd/yyyy)

// Prenatal Care Date of Last Visit (mm/dd/yyyy)

// Prenatal Care Number of Prenatal Visits

// Principal Source of Payment for this Delivery

// Mother Transferred

// Mother Transferred From:


	* Pre-pregnancy variables

// Diabetes Prepregnancy

// Diabetes Gestational 

// Hypertension Prepregnancy

// Hypertension Gestational

// Hypertension Eclampsia

// Previous Preterm Birth

// Other Previous Poor Pregnancy Outcome 

// Previous Cesarean Delivery. 

// Cervical Cerclage

// Tocolysis

// External Cephalic Version: Successful

// External Cephalic Version: Failed

// Premature Rupture of the Membranes

// Precipitous Labor

// Prolonged Labor

// Onset of Labor: None of the Above

// Induction of Labor

// Augmentation of Labor

// Non-Vertex Labor


	* Treatment during Labor


// Steroids Lung Maturation Prior to Del

// Antibiotics Mother During Labor
	* potential infection ICD-9's listed here: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5771993/

// Chorioamnionitis or Maternal Temperature ?38C (100.4F)
	* 762.7 or 658.4

// Moderate/Heavy Meconium Staining
	* 779.84

// Fetal Intolerance of Labor Such That One or More of the Following Actions was Ta

// Epidural or Spinal Anesthesia During Labor
	* No easy code, but some listed here: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3391736/

// Delivery with Forceps Attempted but Unsuccessful?
	* http://www.icd9data.com/2013/Volume1/630-679/660-669/669/669.51.htm
	* 669.51
	* Note similarity to following
	
// Delivery with Vacuum Extraction Attempted but Unsuccessful?
	* http://www.icd9data.com/2013/Volume1/630-679/660-669/669/669.51.htm
	* 669.51
	* Note similarity to previous...
	
// Fetal Presentation at Birth
	* http://www.icd9data.com/2012/Volume1/630-679/650-659/652/default.htm
	* Broadly: 650 - 659
	* Note multiples coded separately.
	* Normal: 650
	* Breech: 652, 652.1, 652.2 652.8
	* but see also maternal indicators: 669.6

// Final Route and Method of Delivery
	* http://www.icd9data.com/2012/Volume1/630-679/650-659/default.htm

// If cesarean, was a trial of labor attempted:
	* http://www.icd9data.com/2012/Volume1/630-679/650-659/659/default.htm
	* maybe 659

// Obs. Est. Gest.

// Assisted Ventilation Immediately Following Delivery
	* V46.14 - http://www.icd9data.com/2012/Volume1/V01-V91/V40-V49/V46/V46.14.htm
	* CPT: 99464. 99465 maybe less useful
	* 96.7, 96.71, 96.72 - continuous invasive mechanical ventilation of varying durations

// Assisted Ventilation Required for more than 6 hours
	* see previous

// NICU Admission
	* not identifiable via ICD-9 but billing codes seem to work.

// Surfactant Replacement Therapy
	* https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3045285/
	* this is identified from pharmacy claims.
	* there is also a respiratory distress ICD: 769 - see discussion in the above paper


// Antibiotics for Suspected Neonatal Sepsis
	* http://www.icd9data.com/2012/Volume1/760-779/764-779/771/771.81.htm
	* probably 779.81
	

// Seizure or Serious Neurologic Dysfunction
	* http://www.icd9data.com/2012/Volume1/760-779/764-779/779/779.0.htm
	* 779, but this is vague

// Significant Birth Injury
	* http://www.icd9data.com/2013/Volume1/760-779/764-779/767/767.9.htm
	* 767.0, 767.11, 767.3, 767.4, 767.6, 767.7

// Abnormal Conditions: None of the Above

// Anencephaly
	* http://www.icd9data.com/2012/Volume1/740-759/740/740.0.htm
	* 740.0

// Meningomyelocele/Spina Bifida
	* http://www.icd9data.com/2012/Volume1/740-759/741/default.htm
	* 741..


// Cyanotic Congenital Heart Disease
	* not exactly identified... 
	* http://www.icd9data.com/2012/Volume1/740-759/746/default.htm
	* 746.0 - 9

// Congenital Diaphragmatic Hernia
	* http://www.icd9data.com/2013/Volume1/740-759/756/756.6.htm
	* 756.6

// Omphalocele
	* http://www.icd9data.com/2014/Volume1/740-759/756/756.72.htm
	* 756.72

// Gastroschisis
	* http://www.icd9data.com/2012/Volume1/740-759/756/756.73.htm
	* 756.73

// Limb Reduction Defect 
	* http://www.icd9data.com/2012/Volume1/740-759/755/default.htm
	* 755.2

// Hypospadias
	* http://www.icd9data.com/2012/Volume1/740-759/752/752.61.htm
	* 752.61 / 753.8

	* Post-delivery outcomes

// Infant Transferred Within 24 Hours	
	* see p. 84ff https://www.hcup-us.ahrq.gov/db/nation/nis/APR-DRGsV20MethodologyOverviewandBibliography.pdf
	* APR-DRG 580 (transferred, not born here)
	* APR DRG 581: (transferred, born here)

// Name of Facility Infant Transferred to:

// Birth Weight Calculated in Grams

// Place of Death (check only one)

// Place of Death Facility Name (If not institution give street address)

// Neonatal Death
	* there is a status indicator - does include deaths.  

	* Weight indicators - created by me.
	* these can be inferred from APR DRG
	* see page 84ff
	* https://www.hcup-us.ahrq.gov/db/nation/nis/APR-DRGsV20MethodologyOverviewandBibliography.pdf
/*
* from explore_apr_drg.do
580 M 15 NEONATE, TRANSFERRED <5 DAYS OLD, NOT BORN HERE
581 M 15 NEONATE, TRANSFERRED < 5 DAYS OLD, BORN HERE

583 P 15 NEONATE W ECMO

588 P 15 NEONATE BWT <1500G W MAJOR PROCEDURE

589 M 15 NEONATE BWT <500G

591 M 15 NEONATE BIRTHWT 500-749G W/O MAJOR PROCEDURE

593 M 15 NEONATE BIRTHWT 750-999G W/O MAJOR PROCEDURE

602 M 15 NEONATE BWT 1000-1249G W RESP DIST SYND/OTH MAJ RESP OR MAJ ANOM
603 M 15 NEONATE BIRTHWT 1000-1249G W OR W/O OTHER SIGNIFICANT CONDITION


607 M 15 NEONATE BWT 1250-1499G W RESP DIST SYND/OTH MAJ RESP OR MAJ ANOM
608 M 15 NEONATE BWT 1250-1499G W OR W/O OTHER SIGNIFICANT CONDITION


609 P 15 NEONATE BWT 1500-2499G W MAJOR PROCEDURE

611 M 15 NEONATE BIRTHWT 1500-1999G W MAJOR ANOMALY
612 M 15 NEONATE BWT 1500-1999G W RESP DIST SYND/OTH MAJ RESP COND
613 M 15 NEONATE BIRTHWT 1500-1999G W CONGENITAL/PERINATAL INFECTION
614 M 15 NEONATE BWT 1500-1999G W OR W/O OTHER SIGNIFICANT CONDITION

621 M 15 NEONATE BWT 2000-2499G W MAJOR ANOMALY
622 M 15 NEONATE BWT 2000-2499G W RESP DIST SYND/OTH MAJ RESP COND
623 M 15 NEONATE BWT 2000-2499G W CONGENITAL/PERINATAL INFECTION
625 M 15 NEONATE BWT 2000-2499G W OTHER SIGNIFICANT CONDITION
626 M 15 NEONATE BWT 2000-2499G, NORMAL NEWBORN OR NEONATE W OTHER PROBLEM

630 P 15 NEONATE BIRTHWT >2499G W MAJOR CARDIOVASCULAR PROCEDURE
631 P 15 NEONATE BIRTHWT >2499G W OTHER MAJOR PROCEDURE
633 M 15 NEONATE BIRTHWT >2499G W MAJOR ANOMALY
634 M 15 NEONATE BIRTHWT >2499G W RESP DIST SYND/OTH MAJ RESP COND
636 M 15 NEONATE BIRTHWT >2499G W CONGENITAL/PERINATAL INFECTION
639 M 15 NEONATE BIRTHWT >2499G W OTHER SIGNIFICANT CONDITION
640 M 15 NEONATE BIRTHWT >2499G, NORMAL NEWBORN OR NEONATE W OTHER PROBLEM
*/

	
	
	
// male 1 if 500 <= weight < 600
// male 1 if 600 <= weight < 700
// male 1 if 700 <= weight < 800
// male 1 if 800 <= weight < 900
// male 1 if 900 <= weight < 1000
// male 1 if 1000<= weight < 1250
// male 1 if 1250 <= weight < 1500
// female 1 if 500 <= weight < 600
// female 1 if 600 <= weight < 700
// female 1 if 700 <= weight < 800
// female 1 if 800 <= weight < 900
// female 1 if 900 <= weight < 1000
// female 1 if 1000<= weight < 1250
// female 1 if 1250 <= weight < 1500
	* Gender probably not inferrable, but:
	* APR-DRG
	* 588 - 
	
/*
	weight < 500 grams if APR_DRG == 589
	weight 500 - 749 grams if APR_DRG == 591
	weight 750 - 999 grams if APR_DRG ==593
	weight 1000 - 1249 grams if APR_DRG == 602 | APR_DRG == 603
	weight 1250 - 1499 grams if APR_DRG == 607 | APR_DRG == 608
	weight 1500 - 1999 grams if APR_DRG == 611 | APR_DRG == 612 | APR_DRG == 613 | APR_DRG == 614
	weight 2000 - 2499 grams if APR_DRG == 621 | APR_DRG == 622 | APR_DRG == 623 | APR_DRG == 625 | APR_DRG == 626
	weight  > 2500 grams if APR_DRG == 630 | APR_DRG == 631 | APR_DRG == 633 | APR_DRG == 634 | APR_DRG == 636 | APR_DRG == 639 | APR_DRG == 640

	weight other <1500 grams if APR_DRG == 588
	weight other 1500 - 2500 grams if APR_DRG == 609

	* See also: http://www.icd9data.com/2012/Volume1/760-779/764-779/765/default.htm
	765.0 - 765.09 for extreme immaturity at various weight bins.
	765.10 - 765.19 for other preterm at various weight bins.  
		
*/	


// 1 if multiple birth
	* multiples: http://www.icd9data.com/2012/Volume1/V01-V91/V30-V39/default.htm
	* 1, 2, and 3+ identifiable.
	* http://www.icd9data.com/2012/Volume1/630-679/650-659/651/default.htm
	* also see 651.0, 651.1, 651.2 for twin, triplet, quadruplet -> plus related for cases w/ loss.
// mutliples: 1 if 500 <= weight < 600
// multiples: 1 if 600 <= weight < 700
// multiple: 1 if 700 <= weight < 800
// multiple: 1 if 800 <= weight < 900
// multiple: 1 if 900 <= weight < 1000
// multiple: 1 if 1000<= weight < 1250
// multiple: 1 if 1250 <= weight < 1500


	* Gest. Age
	* http://www.icd9data.com/2012/Volume1/760-779/764-779/765/default.htm
	* see 765.20 - 765.29
	* not frequently enough used, I think.  
// gestational age < 24 weeks
	* 765.21
	
// gestational age 24 - 25 weeks
	* 765.22 - covers 24
	
// gestational age 26 - 27 weeks
	* 765.23 - covers 25 - 26
	
// gestational age 28 - 29 weeks
	* 765.24 - covers 27 - 28
	
// gestational age 30 - 31 weeks
	* 765.25 - covers 29 - 30
	
// gestational age 32 - 33 weeks
	* 765.26 - covers 31 - 32
	
// gestational age > 34  weeks
	* 765.27 - covers 33 - 34, 
	* 765.28 - covers 35 - 36
	* 765.29 - covers 37 ++

// Small for Gestational Age

// Large for gestational age

// FID of birth facility

// FID of facility transferred to

