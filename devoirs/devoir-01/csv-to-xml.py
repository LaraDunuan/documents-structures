# -*- coding: utf-8 -*-
"""
Lara DUNUAN
11/10/2020
csv-to-xml.py
"""

import csv
from lxml import etree

"""
An Element is the main container object for the ElementTree API. 
Most of the XML tree functionality is accessed through this class. 
Elements are easily created through the Element factory:
"""
toilettes = etree.Element("toilettes")

with open("sanisettesparis.csv") as csvfile: #Open and read CSV input file
	reader = csv.DictReader(csvfile, delimiter=";")

	for row in reader:
		"""
		Create XML tree structure
		"""
		toilette = etree.SubElement(toilettes, "toilette", type=row["TYPE"] , statut=row["STATUT"])

		adresse = etree.SubElement(toilette, "adresse")
		horaire = etree.SubElement(toilette, "horaire")
		services = etree.SubElement(toilette, "services")
		equipement = etree.SubElement(toilette, "equipement")

		libelle = etree.SubElement(adresse, "libelle")
		arrondissement = etree.SubElement(adresse, "arrondissement")
		libelle.text = row["ADRESSE"]
		arrondissement.text = row["ARRONDISSEMENT"]

		horaire.text = row["HORAIRE"]

		acces_pmr = etree.SubElement(services, "acces-pmr")
		relais_bebe = etree.SubElement(services, "relais-bebe")
		acces_pmr.text = row["ACCES_PMR"]
		relais_bebe.text = row["RELAIS_BEBE"]

		equipement.text = row["URL_FICHE_EQUIPEMENT"]
'''
Serialisation:
Serialisation commonly uses the tostring() function that returns a string, or the ElementTree.write() method
'''
etree_data = etree.tostring(toilettes, pretty_print=True, encoding='UTF-8', xml_declaration=True, doctype='''<!DOCTYPE toilettes SYSTEM "wc.dtd">''')


with open('toilettes-paris.xml', 'wb') as xmlfile: #Open and write XML output file
	xmlfile.write(etree_data)