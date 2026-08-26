/*Narcolepsy
 * Slight reduction to stealth
 * Reduces resistance
 * Greatly reduces stage speed
 * No change to transmissibility
 * Fatal level
 * Bonus: Causes drowsiness and sleep.
*/
/datum/symptom/narcolepsy
	name = "Нарколепсия"
	desc = "Вирус вызывает гормональный дисбаланс, в результате чего у зараженного человека появляется сонливость и развивается нарколепсия."
	illness = "Aurora Snorealis"
	stealth = -1
	resistance = -2
	stage_speed = -2
	transmittable = 0
	level = 6
	symptom_delay_min = 30
	symptom_delay_max = 85
	severity = 4
	symptom_cure = /datum/reagent/medicine/ondansetron
	cure_color = "yellow"
	var/yawning = FALSE
	threshold_descs = list(
		"Transmission 4" = "Заставляет носителя периодически издавать зевок, который пытается заразить окружающих, находящихся в радиусе 6 метров от него.",
		"Stage Speed 10" = "Чаще вызывает нарколепсию, повышая вероятность того, что человек засыпает.",
	)

/datum/symptom/narcolepsy/Start(datum/disease/advance/A)
	. = ..()
	if(!.)
		return
	if(A.totalTransmittable() >= 4) //yawning (mostly just some copy+pasted code from sneezing, with a few tweaks)
		yawning = TRUE
	if(A.totalStageSpeed() >= 10) //act more often
		symptom_delay_min = 20
		symptom_delay_max = 45

/datum/symptom/narcolepsy/Activate(datum/disease/advance/A)
	. = ..()
	if(!.)
		return

	var/mob/living/M = A.affected_mob
	switch(A.stage)
		if(1)
			if(prob(50))
				to_chat(M, span_warning("Вы чувствуете усталость."))
		if(2)
			if(prob(50))
				to_chat(M, span_warning("Вы чувствуете себя очень устало."))
		if(3)
			if(prob(50))
				to_chat(M, span_warning("Вы стараетесь сосредоточиться на том, чтобы не заснуть."))

			M.adjust_drowsiness_up_to(10 SECONDS, 140 SECONDS)

		if(4)
			if(prob(50))
				if(yawning)
					to_chat(M, span_warning("Вы пытаетесь сдержать зевок, но у вас не получается."))
				else
					to_chat(M, span_warning("Вы на мгновение задремали.")) //you can't really yawn while nodding off, can you?

			M.adjust_drowsiness_up_to(20 SECONDS, 140 SECONDS)

			if(yawning)
				M.emote("yawn")
				A.airborne_spread(6)

		if(5)
			if(prob(50))
				to_chat(M, span_warning("[pick("Так устали...","Вам очень хочется спать.","Вам с трудом удаётся не закрыть глаза.","Вы пытаетесь не заснуть.")]"))

			M.adjust_drowsiness_up_to(80 SECONDS, 140 SECONDS)

			if(yawning)
				M.emote("yawn")
				A.airborne_spread(6)
