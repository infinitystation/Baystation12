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
	desc = "Позволяет нам высасывать ДНК из тела существа. Они становятся едины с нами, тем самым делая нас сильнее."
	helptext = "OOC: для вашей жертвы - это смерть. Не будьте мудаком и сделайте последние мгновения хоть сколько-нибудь интересными."
	genomecost = 0
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_absorb_dna

/datum/power/changeling/transform
	name = "Transform"
	desc = "Мы принимает вид того, чьё ДНК было поглощено ранее."
	genomecost = 0
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_transform

/datum/power/changeling/fakedeath
	name = "Regenerative Stasis"
	desc = "Мы слабеем до состояния стазиса, где после смерти нас снова ждет жизнь."
	helptext = "Может использоваться до или после смерти. Коме может длиться несколько минут."
	genomecost = 0
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_fakedeath

// Hivemind

/datum/power/changeling/hive_upload
	name = "Hive Channel"
	desc = "Мы способны выпускать ДНК в каналы, позволяя нашим собратьям поглощать их, словно они их поглотили сами."
	helptext = "Позволяет другим генокрадам поглощать ДНК,которым вы поделились. Не поможет в задании на поглощение."
	genomecost = 0
	verbpath = /mob/proc/changeling_hiveupload

/datum/power/changeling/hive_download
	name = "Hive Absorb"
	desc = "Мы способны поглотить ДНК из канала, что в дальнейшем позволит нам использовать больше маскировок."
	helptext = "Позволяет поглощать ДНК и в дальнейшем использовать его. С помощью невозможно выполнить задание."
	genomecost = 0
	verbpath = /mob/proc/changeling_hivedownload

/datum/power/changeling/lesser_form
	name = "Lesser Form"
	desc = "Мы принимаем низшую форму - примата. Это унизительно для нас."
	helptext = "При превращении слетают наручники."
	genomecost = 4
	verbpath = /mob/proc/changeling_lesser_form

/datum/power/changeling/extractdna
	name = "Extract DNA sting"
	desc = "Мы скрытно жалим жертву и извлекаем из неё образец ДНК. Безвкусно, пресно, но жертва останется в живых."
	helptext = "Дает ДНК жертвы, на которой был использован данный навык. Не учитывается в качестве задания на поглощение. Может использоваться в низшей форме."
	genomecost = 2
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_extract_dna_sting

/datum/power/changeling/unfat_sting
	name = "Unfat Sting"
	desc = "Мы скрытно жалим жертву, заставляя её активно потеть и терять питательные вещества."
	genomecost = 2
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_unfat_sting

/datum/power/changeling/transformation_sting
	name = "Transformation Sting"
	desc = "Мы скрытно жалим МЕРТВУЮ жертву, вводя ретровирус, который изменяет её телу по нашему желанию."
	helptext = "Жертва трансформируется так, как трансформировался бы другой генокрад."
	genomecost = 3
	verbpath = /mob/proc/changeling_transformation_sting

/datum/power/changeling/deaf_sting
	name = "Deaf Sting"
	desc = "Мы жалим жертву, тем самым временно создавая у неё слуховой шок. Она ничего не услышит."
	genomecost = 3
	verbpath = /mob/proc/changeling_deaf_sting

/datum/power/changeling/LSDSting
	name = "Hallucination Sting"
	desc = "Мы развиваем способность жалить цель мощными галлюцинационными химикатами."
	helptext = "Цель не замечает укола. Эффект длится от 30 до 60 секунд."
	genomecost = 4
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_lsdsting

/datum/power/changeling/blind_sting
	name = "Blind Sting"
	desc = "Мы жалим жертву, тем самым польностью ослепляя её на короткое время"
	genomecost = 4
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_blind_sting

/datum/power/changeling/silence_sting
	name = "Silence Sting"
	desc = "Мы скрытно жалим жертву, тем самым заставив её замолчать на 30 секунд."
	helptext = "Жертва не узнает о проблеме до тех пор, пока не попытается что-то сказать."
	genomecost = 5
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_silence_sting

/datum/power/changeling/pain_sting
	name = "Pain Sting"
	desc = "Мы жалим жертву, вводя сокращающий мышцы токсин, что вызовет сильную боль. Скорее всего, она станет беззащитной на короткое время."
	helptext = "Жертва будет кричать, если ей не заткнуть рот или не уколоть перед этим жалом тишины."
	genomecost = 6
	verbpath = /mob/proc/changeling_pain_sting

/datum/power/changeling/DeathSting
	name = "Death Sting"
	desc = "Мы жалим жертву, оставляя в её теле опасные химикаты, приводящие к остановке сердца. Из-за них за минуту жертвы откажет сердце, а через 4 - она умрет окончательно."
	helptext = "При применении данный навык будет показан для всех окружающих. Не действует на резоми."
	genomecost = 10
	verbpath = /mob/proc/changeling_DEATHsting

/datum/power/changeling/boost_range
	name = "Boost Range"
	desc = "Мы развили способность стрелять жалом в других существ."
	helptext = "Активируйт перед тем, как использовать жало. Позволяет колоть при разрыве в 1 тайл."
	genomecost = 5
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_boost_range

/datum/power/changeling/Epinephrine
	name = "Epinephrine sacs"
	desc = "Мы активируем энергоклетки, которые вырабатывают адреналин."
	helptext = "Позволяет мнгновенно выйти из оглушения. Для активации необходимо много химикатов."
	genomecost = 5
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_unstun

/datum/power/changeling/ChemicalSynth
	name = "Rapid Chemical-Synthesis"
	desc = "Мы развиваем новые ветви для производства необходимых химикатов, тем самым позволяя восполнять их быстрее."
	helptext = "Удваивает скорость регенерации химикатов."
	genomecost = 5
	isVerb = 0
	verbpath = /mob/proc/changeling_fastchemical

/datum/power/changeling/EngorgedGlands
	name = "Engorged Chemical Glands"
	desc = "Наши химические железы набухают, благодаря чему мы способны хранить больше химикатов."
	helptext = "Позволяет хранить на 25 ед. химикатов больше (75)."
	genomecost = 5
	isVerb = 0
	verbpath = /mob/proc/changeling_engorgedglands

/datum/power/changeling/mimicvoice
	name = "Mimic Voice"
	desc = "Мы подстраиваем голосовые связки так, чтобы они смогли имитировать голос любого существа."
	helptext = "Изменит голос на заданное имя. Постоянно тратит химикаты на поддержание."
	genomecost = 2
	verbpath = /mob/proc/changeling_mimicvoice

/datum/power/changeling/DigitalCamoflague
	name = "Digital Camoflauge"
	desc = "Мы развиваем способность искажать нашу форму и пропорции, дабы скрыть своё существование для камер."
	helptext = "Мы не видны для камер во время использования данного навыка. Однако заметившие нас люди, при взгляде будут испытывать ужас от не логичности нашей формы. Для поддержания навыка мы обязаны постоянно тратить химикаты."
	genomecost = 4
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_digitalcamo

/datum/power/changeling/ThermalVision
	name = "Thermal Vision"
	desc = "Мы направляем небольшое количество химиката в наши глаза, что позволяет нам чувствовтать жертв через препятствия и видеть в темноте."
	helptext = "Сильная восприимчивость к ослеплению во время использования. Тратит химикаты пока активно."
	genomecost = 4
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_thermvision

/datum/power/changeling/rapidregeneration
	name = "Rapid Regeneration"
	desc = "Мы развиваем способность быстро регенерироваться, не прибегая к стазису."
	helptext = "Лечит незначительный урон каждый тик."
	genomecost = 5
	verbpath = /mob/proc/changeling_rapidregen

/datum/power/changeling/dissonant_shriek
	name = "Dissonant Shriek"
	desc = "Мы преобразуем голосовые связки для того, чтобы выпустить высокочастотный звук, который способен вывести из строя ближайшую технику."
	helptext = "Аналог электромагнитной гранаты, но с меньшей мощностью. Нельзя использовать в вентиляции."
	genomecost = 8
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_dissonant_shriek
/*
/datum/power/changeling/spiders
	name = "Spread Spiders"
	desc = "Наша оболочка делиться, создавая новые формы жизни - пауков."
	helptext = "Пауки могут саботировать работу некоторые отделов и точно заставят экипаж шевелиться, вызывая нестабильность."
	genomecost = 10
	verbpath = /mob/proc/changeling_spiders
*/
//weapon and armor like powers

/datum/power/changeling/armblades
	name = "Mutate Armblades"
	desc = "Позволяет нам преобразовывать нашу руку в острое органическое оружие."
	helptext = "Может разрушать неукрепленные стены и вскрывать незаваренные и неболтированные шлюзы. Лезвие не исчезнет до тех пор, пока способность не будет использована повторно."
	genomecost = 8
	verbpath = /mob/proc/armblades

/datum/power/changeling/shield
	name = "Mutate Shield"
	desc = "Позволяет нам преобразовывать нашу кисть в органический щит."
	helptext = "Щит не исчезнет до тех пор, пока способность не будет использована повторно."
	genomecost = 5
	verbpath = /mob/proc/changeling_shield
/*
/datum/power/changeling/horror_form
	name = "Horror Form"
	desc = "Мы разрываем оболочку, являя свету нашу Истинную форму."
	helptext = "Дает способность разрушать неукрепленные стены. При многократной атаке шлюза, оный вскрывается. Быстрое восстановление от брут-урона. Урон от ожогов убирается через поедание существ. Мы больше не человекоподобны."
	genomecost = 16
	verbpath = /mob/proc/horror_form
*/
// Modularchangling, totally stolen from the new player panel.  YAYY
/datum/changeling/proc/EvolutionMenu()//The new one
	set category = "Changeling"
	set desc = "Level up!"

	if(!usr || !usr.mind || !usr.mind.changeling)	return
	src = usr.mind.changeling

	if(!powerinstances.len)
		for(var/P in powers)
			powerinstances += new P()

	var/dat = "<html><head><title>Меню Эволюции</title></head>"

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
						body += "<a href='?src=\ref[src];P="+power+"'>Приобрести</a>"
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
					<font size='5'><b>Меню эволюции</b></font><br>
					Наведите на способность, чтобы узнать подробности<br>
					Текущие геномы: [geneticpoints]<br>
					Поглощайте разумных, чтобы получить больше геномов
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
					<span id='search[i]'><b>[P] - [ownsthis ? "" : "Цена:"] [ownsthis ? "Приобретено" : P.genomecost]</b></span>
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

	show_browser(usr, dat, "window=powers;size=900x480")


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
