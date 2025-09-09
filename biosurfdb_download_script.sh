#!/bin/bash

#collections download
curl https://www.biosurfdb.org/api/get/organism > organism.json
curl https://www.biosurfdb.org/api/get/gene > gene.json
curl https://www.biosurfdb.org/api/get/protein > protein.json
curl https://www.biosurfdb.org/api/get/surfactant > surfactant.json
curl https://www.biosurfdb.org/api/get/metagenome > metagenome.json

#relationships download
curl https://www.biosurfdb.org/api/get/biosurfactant > biosurfactant.json
curl https://www.biosurfdb.org/api/get/meta_surfactant > meta_surfactant.json
curl https://www.biosurfdb.org/api/get/surfactant_pathway > surfactant_pathway.json
curl https://www.biosurfdb.org/api/get/protein_pathway > protein_pathway.json
curl https://www.biosurfdb.org/api/get/gene_pathway > gene_pathway.json
curl https://www.biosurfdb.org/api/get/translation > translation.json
curl https://www.biosurfdb.org/api/get/transcription > transcription.json
curl https://www.biosurfdb.org/api/get/organism_provinience > organism_provinience.json
curl https://www.biosurfdb.org/api/get/bioremediation > bioremediation.json
curl https://www.biosurfdb.org/api/get/surfactant > organism_pathway.json
