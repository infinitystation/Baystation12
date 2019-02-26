// READ: Don't use the apostrophe in name or desc. Causes script errors.

var/list/powers = typesof(/datum/power/changeling) - /datum/power/changeling	//needed for the badmin verb for now
var/list/datum/power/changeling/powerinstances = list()

/datum/power			//Could be used by other antags too
	var/name = "Power"
	var/desc = "Placeholder"
	var/helptext = ""
	var/isVerb = 1 	// Is it an active power, or passive?
	var/verbpath // Path to a verb that contains the effects.

/datum/power/changeling
	var/allowduringlesserform = 0
	var/genomecost = 500000 // Cost for the changling to evolve this power.

/datum/power/changeling/absorb_dna
	name = "Absorb DNA"
	desc = "РџРѕР·РІРѕР»&#255;РµС‚ РЅР°Рј РІС‹СЃР°СЃС‹РІР°С‚СЊ Р”РќРљ РёР· С‚РµР»Р° СЃСѓС‰РµСЃС‚РІР°. РћРЅРё СЃС‚Р°РЅРѕРІ&#255;С‚СЃ&#255; РµРґРёРЅС‹ СЃ РЅР°РјРё, С‚РµРј СЃР°РјС‹Рј РґРµР»Р°&#255; РЅР°СЃ СЃРёР»СЊРЅРµРµ."
	helptext = "OOC: РґР»&#255; РІР°С€РµР№ Р¶РµСЂС‚РІС‹ - СЌС‚Рѕ СЃРјРµСЂС‚СЊ. РќРµ Р±СѓРґСЊС‚Рµ РјСѓРґР°РєРѕРј Рё СЃРґРµР»Р°Р№С‚Рµ РїРѕСЃР»РµРґРЅРёРµ РјРіРЅРѕРІРµРЅРё&#255; С…РѕС‚СЊ СЃРєРѕР»СЊРєРѕ-РЅРёР±СѓРґСЊ РёРЅС‚РµСЂРµСЃРЅС‹РјРё."
	genomecost = 0
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_absorb_dna

/datum/power/changeling/transform
	name = "Transform"
	desc = "РњС‹ РїСЂРёРЅРёРјР°РµС‚ РІРёРґ С‚РѕРіРѕ, С‡СЊС‘ Р”РќРљ Р±С‹Р»Рѕ РїРѕРіР»РѕС‰РµРЅРѕ СЂР°РЅРµРµ."
	genomecost = 0
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_transform

/datum/power/changeling/fakedeath
	name = "Regenerative Stasis"
	desc = "РњС‹ СЃР»Р°Р±РµРµРј РґРѕ СЃРѕСЃС‚Рѕ&#255;РЅРё&#255; СЃС‚Р°Р·РёСЃР°, РіРґРµ РїРѕСЃР»Рµ СЃРјРµСЂС‚Рё РЅР°СЃ СЃРЅРѕРІР° Р¶РґРµС‚ Р¶РёР·РЅСЊ."
	helptext = "РњРѕР¶РµС‚ РёСЃРїРѕР»СЊР·РѕРІР°С‚СЊСЃ&#255; РґРѕ РёР»Рё РїРѕСЃР»Рµ СЃРјРµСЂС‚Рё. РљРѕРјРµ РјРѕР¶РµС‚ РґР»РёС‚СЊСЃ&#255; РЅРµСЃРєРѕР»СЊРєРѕ РјРёРЅСѓС‚."
	genomecost = 0
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_fakedeath

// Hivemind

/datum/power/changeling/hive_upload
	name = "Hive Channel"
	desc = "РњС‹ СЃРїРѕСЃРѕР±РЅС‹ РІС‹РїСѓСЃРєР°С‚СЊ Р”РќРљ РІ РєР°РЅР°Р»С‹, РїРѕР·РІРѕР»&#255;&#255; РЅР°С€РёРј СЃРѕР±СЂР°С‚СЊ&#255;Рј РїРѕРіР»РѕС‰Р°С‚СЊ РёС…, СЃР»РѕРІРЅРѕ РѕРЅРё РёС… РїРѕРіР»РѕС‚РёР»Рё СЃР°РјРё."
	helptext = "РџРѕР·РІРѕР»&#255;РµС‚ РґСЂСѓРіРёРј РіРµРЅРѕРєСЂР°РґР°Рј РїРѕРіР»РѕС‰Р°С‚СЊ Р”РќРљ,РєРѕС‚РѕСЂС‹Рј РІС‹ РїРѕРґРµР»РёР»РёСЃСЊ. РќРµ РїРѕРјРѕР¶РµС‚ РІ Р·Р°РґР°РЅРёРё РЅР° РїРѕРіР»РѕС‰РµРЅРёРµ."
	genomecost = 0
	verbpath = /mob/proc/changeling_hiveupload

/datum/power/changeling/hive_download
	name = "Hive Absorb"
	desc = "РњС‹ СЃРїРѕСЃРѕР±РЅС‹ РїРѕРіР»РѕС‚РёС‚СЊ Р”РќРљ РёР· РєР°РЅР°Р»Р°, С‡С‚Рѕ РІ РґР°Р»СЊРЅРµР№С€РµРј РїРѕР·РІРѕР»РёС‚ РЅР°Рј РёСЃРїРѕР»СЊР·РѕРІР°С‚СЊ Р±РѕР»СЊС€Рµ РјР°СЃРєРёСЂРѕРІРѕРє."
	helptext = "РџРѕР·РІРѕР»&#255;РµС‚ РїРѕРіР»РѕС‰Р°С‚СЊ Р”РќРљ Рё РІ РґР°Р»СЊРЅРµР№С€РµРј РёСЃРїРѕР»СЊР·РѕРІР°С‚СЊ РµРіРѕ. РЎ РїРѕРјРѕС‰СЊСЋ РЅРµРІРѕР·РјРѕР¶РЅРѕ РІС‹РїРѕР»РЅРёС‚СЊ Р·Р°РґР°РЅРёРµ."
	genomecost = 0
	verbpath = /mob/proc/changeling_hivedownload

/datum/power/changeling/lesser_form
	name = "Lesser Form"
	desc = "РњС‹ РїСЂРёРЅРёРјР°РµРј РЅРёР·С€СѓСЋ С„РѕСЂРјСѓ - РїСЂРёРјР°С‚Р°. Р­С‚Рѕ СѓРЅРёР·РёС‚РµР»СЊРЅРѕ РґР»&#255; РЅР°СЃ."
	helptext = "РџСЂРё РїСЂРµРІСЂР°С‰РµРЅРёРё СЃР»РµС‚Р°СЋС‚ РЅР°СЂСѓС‡РЅРёРєРё."
	genomecost = 4
	verbpath = /mob/proc/changeling_lesser_form

/datum/power/changeling/extractdna
	name = "Extract DNA sting"
	desc = "Мы скрытно жалим жертву и извлекаем из неё образец ДНК. Безвкусно, пресно, но жертва останетс&#255; в живых."
	helptext = "Дает ДНК жертвы, на которой был использован данный навык. Не учитываетс&#255; в качестве задани&#255; на поглощение. Может использоватьс&#255; в низшей форме."
	genomecost = 2
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_extract_dna_sting

/datum/power/changeling/unfat_sting
	name = "Unfat Sting"
	desc = "РњС‹ СЃРєСЂС‹С‚РЅРѕ Р¶Р°Р»РёРј Р¶РµСЂС‚РІСѓ, Р·Р°СЃС‚Р°РІР»&#255;&#255; РµС‘ Р°РєС‚РёРІРЅРѕ РїРѕС‚РµС‚СЊ Рё С‚РµСЂ&#255;С‚СЊ РїРёС‚Р°С‚РµР»СЊРЅС‹Рµ РІРµС‰РµСЃС‚РІР°."
	genomecost = 2
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_unfat_sting

/datum/power/changeling/transformation_sting
	name = "Transformation Sting"
	desc = "РњС‹ СЃРєСЂС‹С‚РЅРѕ Р¶Р°Р»РёРј РњР•Р РўР’РЈР® Р¶РµСЂС‚РІСѓ, РІРІРѕРґ&#255; СЂРµС‚СЂРѕРІРёСЂСѓСЃ, РєРѕС‚РѕСЂС‹Р№ РёР·РјРµРЅ&#255;РµС‚ РµС‘ С‚РµР»Сѓ РїРѕ РЅР°С€РµРјСѓ Р¶РµР»Р°РЅРёСЋ."
	helptext = "Р–РµСЂС‚РІР° С‚СЂР°РЅСЃС„РѕСЂРјРёСЂСѓРµС‚СЃ&#255; С‚Р°Рє, РєР°Рє С‚СЂР°РЅСЃС„РѕСЂРјРёСЂРѕРІР°Р»СЃ&#255; Р±С‹ РґСЂСѓРіРѕР№ РіРµРЅРѕРєСЂР°Рґ."
	genomecost = 3
	verbpath = /mob/proc/changeling_transformation_sting

/datum/power/changeling/deaf_sting
	name = "Deaf Sting"
	desc = "РњС‹ Р¶Р°Р»РёРј Р¶РµСЂС‚РІСѓ, С‚РµРј СЃР°РјС‹Рј РІСЂРµРјРµРЅРЅРѕ СЃРѕР·РґР°РІР°&#255; Сѓ РЅРµС‘ СЃР»СѓС…РѕРІРѕР№ С€РѕРє. РћРЅР° РЅРёС‡РµРіРѕ РЅРµ СѓСЃР»С‹С€РёС‚."
	genomecost = 3
	verbpath = /mob/proc/changeling_deaf_sting

/datum/power/changeling/LSDSting
	name = "Hallucination Sting"
	desc = "РњС‹ СЂР°Р·РІРёРІР°РµРј СЃРїРѕСЃРѕР±РЅРѕСЃС‚СЊ Р¶Р°Р»РёС‚СЊ С†РµР»СЊ РјРѕС‰РЅС‹РјРё РіР°Р»Р»СЋС†РёРЅР°С†РёРѕРЅРЅС‹РјРё С…РёРјРёРєР°С‚Р°РјРё."
	helptext = "Р¦РµР»СЊ РЅРµ Р·Р°РјРµС‡Р°РµС‚ СѓРєРѕР»Р°. Р­С„С„РµРєС‚ РґР»РёС‚СЃ&#255; РѕС‚ 30 РґРѕ 60 СЃРµРєСѓРЅРґ."
	genomecost = 4
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_lsdsting

/datum/power/changeling/blind_sting
	name = "Blind Sting"
	desc = "РњС‹ Р¶Р°Р»РёРј Р¶РµСЂС‚РІСѓ, С‚РµРј СЃР°РјС‹Рј РїРѕР»СЊРЅРѕСЃС‚СЊСЋ РѕСЃР»РµРїР»&#255;&#255; РµС‘ РЅР° РєРѕСЂРѕС‚РєРѕРµ РІСЂРµРј&#255;"
	genomecost = 4
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_blind_sting

/datum/power/changeling/silence_sting
	name = "Silence Sting"
	desc = "РњС‹ СЃРєСЂС‹С‚РЅРѕ Р¶Р°Р»РёРј Р¶РµСЂС‚РІСѓ, С‚РµРј СЃР°РјС‹Рј Р·Р°СЃС‚Р°РІРёРІ РµС‘ Р·Р°РјРѕР»С‡Р°С‚СЊ РЅР° 30 СЃРµРєСѓРЅРґ."
	helptext = "Р–РµСЂС‚РІР° РЅРµ СѓР·РЅР°РµС‚ Рѕ РїСЂРѕР±Р»РµРјРµ РґРѕ С‚РµС… РїРѕСЂ, РїРѕРєР° РЅРµ РїРѕРїС‹С‚Р°РµС‚СЃ&#255; С‡С‚Рѕ-С‚Рѕ СЃРєР°Р·Р°С‚СЊ."
	genomecost = 5
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_silence_sting

/datum/power/changeling/pain_sting
	name = "Pain Sting"
	desc = "РњС‹ Р¶Р°Р»РёРј Р¶РµСЂС‚РІСѓ, РІРІРѕРґ&#255; СЃРѕРєСЂР°С‰Р°СЋС‰РёР№ РјС‹С€С†С‹ С‚РѕРєСЃРёРЅ, С‡С‚Рѕ РІС‹Р·РѕРІРµС‚ СЃРёР»СЊРЅСѓСЋ Р±РѕР»СЊ. РЎРєРѕСЂРµРµ РІСЃРµРіРѕ, РѕРЅР° СЃС‚Р°РЅРµС‚ Р±РµР·Р·Р°С‰РёС‚РЅРѕР№ РЅР° РєРѕСЂРѕС‚РєРѕРµ РІСЂРµРј&#255;."
	helptext = "Р–РµСЂС‚РІР° Р±СѓРґРµС‚ РєСЂРёС‡Р°С‚СЊ, РµСЃР»Рё РµР№ РЅРµ Р·Р°С‚РєРЅСѓС‚СЊ СЂРѕС‚ РёР»Рё РЅРµ СѓРєРѕР»РѕС‚СЊ РїРµСЂРµРґ СЌС‚РёРј Р¶Р°Р»РѕРј С‚РёС€РёРЅС‹."
	genomecost = 6
	verbpath = /mob/proc/changeling_pain_sting

/datum/power/changeling/DeathSting
	name = "Death Sting"
	desc = "РњС‹ Р¶Р°Р»РёРј Р¶РµСЂС‚РІСѓ, РѕСЃС‚Р°РІР»&#255;&#255; РІ РµС‘ С‚РµР»Рµ РѕРїР°СЃРЅС‹Рµ С…РёРјРёРєР°С‚С‹, РїСЂРёРІРѕРґСЏС‰РёРµ Рє РѕСЃС‚Р°РЅРѕРІРєРµ СЃРµСЂРґС†Р°. РР·-Р·Р° РЅРёС… Р·Р° РјРёРЅСѓС‚Сѓ Р¶РµСЂС‚РІС‹ РѕС‚РєР°Р¶РµС‚ СЃРµСЂРґС†Рµ, Р° С‡РµСЂРµР· 4 - РѕРЅР° СѓРјСЂРµС‚ РѕРєРѕРЅС‡Р°С‚РµР»СЊРЅРѕ."
	helptext = "РџСЂРё РїСЂРёРјРµРЅРµРЅРёРё РґР°РЅРЅС‹Р№ РЅР°РІС‹Рє Р±СѓРґРµС‚ РїРѕРєР°Р·Р°РЅ РґР»&#255; РІСЃРµС… РѕРєСЂСѓР¶Р°СЋС‰РёС…. РќРµ РґРµР№СЃС‚РІСѓРµС‚ РЅР° СЂРµР·РѕРјРё."
	genomecost = 10
	verbpath = /mob/proc/changeling_DEATHsting

/datum/power/changeling/boost_range
	name = "Boost Range"
	desc = "РњС‹ СЂР°Р·РІРёР»Рё СЃРїРѕСЃРѕР±РЅРѕСЃС‚СЊ СЃС‚СЂРµР»&#255;С‚СЊ Р¶Р°Р»РѕРј РІ РґСЂСѓРіРёС… СЃСѓС‰РµСЃС‚РІ."
	helptext = "РђРєС‚РёРІРёСЂСѓР№С‚ РїРµСЂРµРґ С‚РµРј, РєР°Рє РёСЃРїРѕР»СЊР·РѕРІР°С‚СЊ Р¶Р°Р»Рѕ. РџРѕР·РІРѕР»&#255;РµС‚ РєРѕР»РѕС‚СЊ РїСЂРё СЂР°Р·СЂС‹РІРµ РІ 1 С‚Р°Р№Р»."
	genomecost = 5
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_boost_range

/datum/power/changeling/Epinephrine
	name = "Epinephrine sacs"
	desc = "РњС‹ Р°РєС‚РёРІРёСЂСѓРµРј СЌРЅРµСЂРіРѕРєР»РµС‚РєРё, РєРѕС‚РѕСЂС‹Рµ РІС‹СЂР°Р±Р°С‚С‹РІР°СЋС‚ Р°РґСЂРµРЅР°Р»РёРЅ."
	helptext = "РџРѕР·РІРѕР»&#255;РµС‚ РјРЅРіРЅРѕРІРµРЅРЅРѕ РІС‹Р№С‚Рё РёР· РѕРіР»СѓС€РµРЅРё&#255;. Р”Р»&#255; Р°РєС‚РёРІР°С†РёРё РЅРµРѕР±С…РѕРґРёРјРѕ РјРЅРѕРіРѕ С…РёРјРёРєР°С‚РѕРІ."
	genomecost = 5
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_unstun

/datum/power/changeling/ChemicalSynth
	name = "Rapid Chemical-Synthesis"
	desc = "РњС‹ СЂР°Р·РІРёРІР°РµРј РЅРѕРІС‹Рµ РІРµС‚РІРё РґР»&#255; РїСЂРѕРёР·РІРѕРґСЃС‚РІР° РЅРµРѕР±С…РѕРґРёРјС‹С… С…РёРјРёРєР°С‚РѕРІ, С‚РµРј СЃР°РјС‹Рј РїРѕР·РІРѕР»&#255;&#255; РІРѕСЃРїРѕР»РЅ&#255;С‚СЊ РёС… Р±С‹СЃС‚СЂРµРµ."
	helptext = "РЈРґРІР°РёРІР°РµС‚ СЃРєРѕСЂРѕСЃС‚СЊ СЂРµРіРµРЅРµСЂР°С†РёРё С…РёРјРёРєР°С‚РѕРІ."
	genomecost = 5
	isVerb = 0
	verbpath = /mob/proc/changeling_fastchemical

/datum/power/changeling/EngorgedGlands
	name = "Engorged Chemical Glands"
	desc = "РќР°С€Рё С…РёРјРёС‡РµСЃРєРёРµ Р¶РµР»РµР·С‹ РЅР°Р±СѓС…Р°СЋС‚, Р±Р»Р°РіРѕРґР°СЂ&#255; С‡РµРјСѓ РјС‹ СЃРїРѕСЃРѕР±РЅС‹ С…СЂР°РЅРёС‚СЊ Р±РѕР»СЊС€Рµ С…РёРјРёРєР°С‚РѕРІ."
	helptext = "РџРѕР·РІРѕР»&#255;РµС‚ С…СЂР°РЅРёС‚СЊ РЅР° 25 РµРґ. С…РёРјРёРєР°С‚РѕРІ Р±РѕР»СЊС€Рµ (75)."
	genomecost = 5
	isVerb = 0
	verbpath = /mob/proc/changeling_engorgedglands

/datum/power/changeling/mimicvoice
	name = "Mimic Voice"
	desc = "РњС‹ РїРѕРґСЃС‚СЂР°РёРІР°РµРј РіРѕР»РѕСЃРѕРІС‹Рµ СЃРІ&#255;Р·РєРё С‚Р°Рє, С‡С‚РѕР±С‹ РѕРЅРё СЃРјРѕРіР»Рё РёРјРёС‚РёСЂРѕРІР°С‚СЊ РіРѕР»РѕСЃ Р»СЋР±РѕРіРѕ СЃСѓС‰РµСЃС‚РІР°."
	helptext = "РР·РјРµРЅРёС‚ РіРѕР»РѕСЃ РЅР° Р·Р°РґР°РЅРЅРѕРµ РёРј&#255;. РџРѕСЃС‚Рѕ&#255;РЅРЅРѕ С‚СЂР°С‚РёС‚ С…РёРјРёРєР°С‚С‹ РЅР° РїРѕРґРґРµСЂР¶Р°РЅРёРµ."
	genomecost = 2
	verbpath = /mob/proc/changeling_mimicvoice

/datum/power/changeling/DigitalCamoflague
	name = "Digital Camoflauge"
	desc = "РњС‹ СЂР°Р·РІРёРІР°РµРј СЃРїРѕСЃРѕР±РЅРѕСЃС‚СЊ РёСЃРєР°Р¶Р°С‚СЊ РЅР°С€Сѓ С„РѕСЂРјСѓ Рё РїСЂРѕРїРѕСЂС†РёРё, РґР°Р±С‹ СЃРєСЂС‹С‚СЊ СЃРІРѕС‘ СЃСѓС‰РµСЃС‚РІРѕРІР°РЅРёРµ РґР»&#255; РєР°РјРµСЂ."
	helptext = "РњС‹ РЅРµ РІРёРґРЅС‹ РґР»&#255; РєР°РјРµСЂ РІРѕ РІСЂРµРј&#255; РёСЃРїРѕР»СЊР·РѕРІР°РЅРё&#255; РґР°РЅРЅРѕРіРѕ РЅР°РІС‹РєР°. РћРґРЅР°РєРѕ Р·Р°РјРµС‚РёРІС€РёРµ РЅР°СЃ Р»СЋРґРё, РїСЂРё РІР·РіР»&#255;РґРµ Р±СѓРґСѓС‚ РёСЃРїС‹С‚С‹РІР°С‚СЊ СѓР¶Р°СЃ РѕС‚ РЅРµ Р»РѕРіРёС‡РЅРѕСЃС‚Рё РЅР°С€РµР№ С„РѕСЂРјС‹. Р”Р»&#255; РїРѕРґРґРµСЂР¶Р°РЅРё&#255; РЅР°РІС‹РєР° РјС‹ РѕР±&#255;Р·Р°РЅС‹ РїРѕСЃС‚Рѕ&#255;РЅРЅРѕ С‚СЂР°С‚РёС‚СЊ С…РёРјРёРєР°С‚С‹."
	genomecost = 4
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_digitalcamo

/datum/power/changeling/ThermalVision
	name = "Thermal Vision"
	desc = "РњС‹ РЅР°РїСЂР°РІР»&#255;РµРј РЅРµР±РѕР»СЊС€РѕРµ РєРѕР»РёС‡РµСЃС‚РІРѕ С…РёРјРёРєР°С‚Р° РІ РЅР°С€Рё РіР»Р°Р·Р°, С‡С‚Рѕ РїРѕР·РІРѕР»&#255;РµС‚ РЅР°Рј С‡СѓРІСЃС‚РІРѕРІС‚Р°С‚СЊ Р¶РµСЂС‚РІ С‡РµСЂРµР· РїСЂРµРї&#255;С‚СЃС‚РІРё&#255; Рё РІРёРґРµС‚СЊ РІ С‚РµРјРЅРѕС‚Рµ."
	helptext = "РЎРёР»СЊРЅР°&#255; РІРѕСЃРїСЂРёРёРјС‡РёРІРѕСЃС‚СЊ Рє РѕСЃР»РµРїР»РµРЅРёСЋ РІРѕ РІСЂРµРј&#255; РёСЃРїРѕР»СЊР·РѕРІР°РЅРё&#255;. РўСЂР°С‚РёС‚ С…РёРјРёРєР°С‚С‹ РїРѕРєР° Р°РєС‚РёРІРЅРѕ."
	genomecost = 4
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_thermvision

/datum/power/changeling/rapidregeneration
	name = "Rapid Regeneration"
	desc = "РњС‹ СЂР°Р·РІРёРІР°РµРј СЃРїРѕСЃРѕР±РЅРѕСЃС‚СЊ Р±С‹СЃС‚СЂРѕ СЂРµРіРµРЅРµСЂРёСЂРѕРІР°С‚СЊСЃ&#255;, РЅРµ РїСЂРёР±РµРіР°&#255; Рє СЃС‚Р°Р·РёСЃСѓ."
	helptext = "Р›РµС‡РёС‚ РЅРµР·РЅР°С‡РёС‚РµР»СЊРЅС‹Р№ СѓСЂРѕРЅ РєР°Р¶РґС‹Р№ С‚РёРє."
	genomecost = 5
	verbpath = /mob/proc/changeling_rapidregen

/datum/power/changeling/dissonant_shriek
	name = "Dissonant Shriek"
	desc = "РњС‹ РїСЂРµРѕР±СЂР°Р·СѓРµРј РіРѕР»РѕСЃРѕРІС‹Рµ СЃРІ&#255;Р·РєРё РґР»&#255; С‚РѕРіРѕ, С‡С‚РѕР±С‹ РІС‹РїСѓСЃС‚РёС‚СЊ РІС‹СЃРѕРєРѕС‡Р°СЃС‚РѕС‚РЅС‹Р№ Р·РІСѓРє, РєРѕС‚РѕСЂС‹Р№ СЃРїРѕСЃРѕР±РµРЅ РІС‹РІРµСЃС‚Рё РёР· СЃС‚СЂРѕ&#255; Р±Р»РёР¶Р°Р№С€СѓСЋ С‚РµС…РЅРёРєСѓ."
	helptext = "РђРЅР°Р»РѕРі СЌР»РµРєС‚СЂРѕРјР°РіРЅРёС‚РЅРѕР№ РіСЂР°РЅР°С‚С‹, РЅРѕ СЃ РјРµРЅСЊС€РµР№ РјРѕС‰РЅРѕСЃС‚СЊСЋ. РќРµР»СЊР·&#255; РёСЃРїРѕР»СЊР·РѕРІР°С‚СЊ РІ РІРµРЅС‚РёР»&#255;С†РёРё."
	genomecost = 8
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_dissonant_shriek

/datum/power/changeling/spiders
	name = "Spread Spiders"
	desc = "РќР°С€Р° РѕР±РѕР»РѕС‡РєР° РґРµР»РёС‚СЊСЃ&#255;, СЃРѕР·РґР°РІР°&#255; РЅРѕРІС‹Рµ С„РѕСЂРјС‹ Р¶РёР·РЅРё - РїР°СѓРєРѕРІ."
	helptext = "РџР°СѓРєРё РјРѕРіСѓС‚ СЃР°Р±РѕС‚РёСЂРѕРІР°С‚СЊ СЂР°Р±РѕС‚Сѓ РЅРµРєРѕС‚РѕСЂС‹Рµ РѕС‚РґРµР»РѕРІ Рё С‚РѕС‡РЅРѕ Р·Р°СЃС‚Р°РІ&#255;С‚ СЌРєРёРїР°Р¶ С€РµРІРµР»РёС‚СЊСЃ&#255;, РІС‹Р·С‹РІР°СЏ РЅРµСЃС‚Р°Р±РёР»СЊРЅРѕСЃС‚СЊ."
	genomecost = 10
	verbpath = /mob/proc/changeling_spiders

//weapon and armor like powers

/datum/power/changeling/armblades
	name = "Mutate Armblades"
	desc = "РџРѕР·РІРѕР»&#255;РµС‚ РЅР°Рј РїСЂРµРѕР±СЂР°Р·РѕРІС‹РІР°С‚СЊ РЅР°С€Сѓ СЂСѓРєСѓ РІ РѕСЃС‚СЂРѕРµ РѕСЂРіР°РЅРёС‡РµСЃРєРѕРµ РѕСЂСѓР¶РёРµ."
	helptext = "РњРѕР¶РµС‚ СЂР°Р·СЂСѓС€Р°С‚СЊ РЅРµСѓРєСЂРµРїР»РµРЅРЅС‹Рµ СЃС‚РµРЅС‹ Рё РІСЃРєСЂС‹РІР°С‚СЊ РЅРµР·Р°РІР°СЂРµРЅРЅС‹Рµ Рё РЅРµР±РѕР»С‚РёСЂРѕРІР°РЅРЅС‹Рµ С€Р»СЋР·С‹. Р›РµР·РІРёРµ РЅРµ РёСЃС‡РµР·РЅРµС‚ РґРѕ С‚РµС… РїРѕСЂ, РїРѕРєР° СЃРїРѕСЃРѕР±РЅРѕСЃС‚СЊ РЅРµ Р±СѓРґРµС‚ РёСЃРїРѕР»СЊР·РѕРІР°РЅР° РїРѕРІС‚РѕСЂРЅРѕ."
	genomecost = 8
	verbpath = /mob/proc/armblades

/datum/power/changeling/shield
	name = "Mutate Shield"
	desc = "РџРѕР·РІРѕР»&#255;РµС‚ РЅР°Рј РїСЂРµРѕР±СЂР°Р·РѕРІС‹РІР°С‚СЊ РЅР°С€Сѓ РєРёСЃС‚СЊ РІ РѕСЂРіР°РЅРёС‡РµСЃРєРёР№ С‰РёС‚."
	helptext = "Р©РёС‚ РЅРµ РёСЃС‡РµР·РЅРµС‚ РґРѕ С‚РµС… РїРѕСЂ, РїРѕРєР° СЃРїРѕСЃРѕР±РЅРѕСЃС‚СЊ РЅРµ Р±СѓРґРµС‚ РёСЃРїРѕР»СЊР·РѕРІР°РЅР° РїРѕРІС‚РѕСЂРЅРѕ."
	genomecost = 5
	verbpath = /mob/proc/changeling_shield

/datum/power/changeling/horror_form
	name = "Horror Form"
	desc = "РњС‹ СЂР°Р·СЂС‹РІР°РµРј РѕР±РѕР»РѕС‡РєСѓ, &#255;РІР»&#255;&#255; СЃРІРµС‚Сѓ РЅР°С€Сѓ РСЃС‚РёРЅРЅСѓСЋ С„РѕСЂРјСѓ."
	helptext = "Р”Р°РµС‚ СЃРїРѕСЃРѕР±РЅРѕСЃС‚СЊ СЂР°Р·СЂСѓС€Р°С‚СЊ РЅРµСѓРєСЂРµРїР»РµРЅРЅС‹Рµ СЃС‚РµРЅС‹. РџСЂРё РјРЅРѕРіРѕРєСЂР°С‚РЅРѕР№ Р°С‚Р°РєРµ С€Р»СЋР·Р°, РѕРЅС‹Р№ РІСЃРєСЂС‹РІР°РµС‚СЃ&#255;. Р‘С‹СЃС‚СЂРѕРµ РІРѕСЃСЃС‚Р°РЅРѕРІР»РµРЅРёРµ РѕС‚ Р±СЂСѓС‚-СѓСЂРѕРЅР°. РЈСЂРѕРЅ РѕС‚ РѕР¶РѕРіРѕРІ СѓР±РёСЂР°РµС‚СЃ&#255; С‡РµСЂРµР· РїРѕРµРґР°РЅРёРµ СЃСѓС‰РµСЃС‚РІ. РњС‹ Р±РѕР»СЊС€Рµ РЅРµ С‡РµР»РѕРІРµРєРѕРїРѕРґРѕР±РЅС‹."
	genomecost = 16
	verbpath = /mob/proc/horror_form

// Modularchangling, totally stolen from the new player panel.  YAYY
/datum/changeling/proc/EvolutionMenu()//The new one
	set category = "Changeling"
	set desc = "Level up!"

	if(!usr || !usr.mind || !usr.mind.changeling)	return
	src = usr.mind.changeling

	if(!powerinstances.len)
		for(var/P in powers)
			powerinstances += new P()

	var/dat = "<html><head><title>Changling Evolution Menu</title></head>"

	//javascript, the part that does most of the work~
	dat += {"

		<head>
			<script type='text/javascript'>

				var locked_tabs = new Array();

				function updateSearch(){


					var filter_text = document.getElementById('filter');
					var filter = filter_text.value.toLowerCase();

					if(complete_list != null && complete_list != ""){
						var mtbl = document.getElementById("maintable_data_archive");
						mtbl.innerHTML = complete_list;
					}

					if(filter.value == ""){
						return;
					}else{

						var maintable_data = document.getElementById('maintable_data');
						var ltr = maintable_data.getElementsByTagName("tr");
						for ( var i = 0; i < ltr.length; ++i )
						{
							try{
								var tr = ltr\[i\];
								if(tr.getAttribute("id").indexOf("data") != 0){
									continue;
								}
								var ltd = tr.getElementsByTagName("td");
								var td = ltd\[0\];
								var lsearch = td.getElementsByTagName("b");
								var search = lsearch\[0\];
								//var inner_span = li.getElementsByTagName("span")\[1\] //Should only ever contain one element.
								//document.write("<p>"+search.innerText+"<br>"+filter+"<br>"+search.innerText.indexOf(filter))
								if ( search.innerText.toLowerCase().indexOf(filter) == -1 )
								{
									//document.write("a");
									//ltr.removeChild(tr);
									td.innerHTML = "";
									i--;
								}
							}catch(err) {   }
						}
					}

					var count = 0;
					var index = -1;
					var debug = document.getElementById("debug");

					locked_tabs = new Array();

				}

				function expand(id,name,desc,helptext,power,ownsthis){

					clearAll();

					var span = document.getElementById(id);

					body = "<table><tr><td>";

					body += "</td><td align='center'>";

					body += "<font size='2'><b>"+desc+"</b></font> <BR>"

					body += "<font size='2'><font color = 'red'><b>"+helptext+"</b></font></font><BR>"

					if(!ownsthis)
					{
						body += "<a href='?src=\ref[src];P="+power+"'>Evolve</a>"
					}

					body += "</td><td align='center'>";

					body += "</td></tr></table>";


					span.innerHTML = body
				}

				function clearAll(){
					var spans = document.getElementsByTagName('span');
					for(var i = 0; i < spans.length; i++){
						var span = spans\[i\];

						var id = span.getAttribute("id");

						if(!(id.indexOf("item")==0))
							continue;

						var pass = 1;

						for(var j = 0; j < locked_tabs.length; j++){
							if(locked_tabs\[j\]==id){
								pass = 0;
								break;
							}
						}

						if(pass != 1)
							continue;




						span.innerHTML = "";
					}
				}

				function addToLocked(id,link_id,notice_span_id){
					var link = document.getElementById(link_id);
					var decision = link.getAttribute("name");
					if(decision == "1"){
						link.setAttribute("name","2");
					}else{
						link.setAttribute("name","1");
						removeFromLocked(id,link_id,notice_span_id);
						return;
					}

					var pass = 1;
					for(var j = 0; j < locked_tabs.length; j++){
						if(locked_tabs\[j\]==id){
							pass = 0;
							break;
						}
					}
					if(!pass)
						return;
					locked_tabs.push(id);
					var notice_span = document.getElementById(notice_span_id);
					notice_span.innerHTML = "<font color='red'>Locked</font> ";
					//link.setAttribute("onClick","attempt('"+id+"','"+link_id+"','"+notice_span_id+"');");
					//document.write("removeFromLocked('"+id+"','"+link_id+"','"+notice_span_id+"')");
					//document.write("aa - "+link.getAttribute("onClick"));
				}

				function attempt(ab){
					return ab;
				}

				function removeFromLocked(id,link_id,notice_span_id){
					//document.write("a");
					var index = 0;
					var pass = 0;
					for(var j = 0; j < locked_tabs.length; j++){
						if(locked_tabs\[j\]==id){
							pass = 1;
							index = j;
							break;
						}
					}
					if(!pass)
						return;
					locked_tabs\[index\] = "";
					var notice_span = document.getElementById(notice_span_id);
					notice_span.innerHTML = "";
					//var link = document.getElementById(link_id);
					//link.setAttribute("onClick","addToLocked('"+id+"','"+link_id+"','"+notice_span_id+"')");
				}

				function selectTextField(){
					var filter_text = document.getElementById('filter');
					filter_text.focus();
					filter_text.select();
				}

			</script>
		</head>


	"}

	//body tag start + onload and onkeypress (onkeyup) javascript event calls
	dat += "<body onload='selectTextField(); updateSearch();' onkeyup='updateSearch();'>"

	//title + search bar
	dat += {"

		<table width='560' align='center' cellspacing='0' cellpadding='5' id='maintable'>
			<tr id='title_tr'>
				<td align='center'>
					<font size='5'><b>Changling Evolution Menu</b></font><br>
					Hover over a power to see more information<br>
					Current evolution points left to evolve with: [geneticpoints]<br>
					Absorb genomes to acquire more evolution points
					<p>
				</td>
			</tr>
			<tr id='search_tr'>
				<td align='center'>
					<b>Search:</b> <input type='text' id='filter' value='' style='width:300px;'>
				</td>
			</tr>
	</table>

	"}

	//player table header
	dat += {"
		<span id='maintable_data_archive'>
		<table width='560' align='center' cellspacing='0' cellpadding='5' id='maintable_data'>"}

	var/i = 1
	for(var/datum/power/changeling/P in powerinstances)
		var/ownsthis = 0

		if(P in purchasedpowers)
			ownsthis = 1


		var/color = "#e6e6e6"
		if(i%2 == 0)
			color = "#f2f2f2"


		dat += {"

			<tr id='data[i]' name='[i]' onClick="addToLocked('item[i]','data[i]','notice_span[i]')">
				<td align='center' bgcolor='[color]'>
					<span id='notice_span[i]'></span>
					<a id='link[i]'
					onmouseover='expand("item[i]","[P.name]","[P.desc]","[P.helptext]","[P]",[ownsthis])'
					>
					<span id='search[i]'><b>Evolve [P] - Cost: [ownsthis ? "Purchased" : P.genomecost]</b></span>
					</a>
					<br><span id='item[i]'></span>
				</td>
			</tr>

		"}

		i++


	//player table ending
	dat += {"
		</table>
		</span>

		<script type='text/javascript'>
			var maintable = document.getElementById("maintable_data_archive");
			var complete_list = maintable.innerHTML;
		</script>
	</body></html>
	"}

	usr << browse(dat, "window=powers;size=900x480")


/datum/changeling/Topic(href, href_list)
	..()
	if(!ismob(usr))
		return

	if(href_list["P"])
		var/datum/mind/M = usr.mind
		if(!istype(M))
			return
		purchasePower(M, href_list["P"])
		call(/datum/changeling/proc/EvolutionMenu)()



/datum/changeling/proc/purchasePower(var/datum/mind/M, var/Pname, var/remake_verbs = 1)
	if(!M || !M.changeling)
		return

	var/datum/power/changeling/Thepower = Pname


	for (var/datum/power/changeling/P in powerinstances)
		if(P.name == Pname)
			Thepower = P
			break


	if(Thepower == null)
		to_chat(M.current, "This is awkward. Changeling power purchase failed, please report this bug to a coder!")
		return

	if(Thepower in purchasedpowers)
		to_chat(M.current, SPAN_LING("We have already evolved this ability!"))

	if(geneticpoints < Thepower.genomecost)
		to_chat(M.current, SPAN_LING("We cannot evolve this... yet.  We must acquire more DNA."))
		return

	geneticpoints -= Thepower.genomecost

	purchasedpowers += Thepower

	if(!Thepower.isVerb && Thepower.verbpath)
		call(M.current, Thepower.verbpath)()
	else if(remake_verbs)
		M.current.make_changeling()
