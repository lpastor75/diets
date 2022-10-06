; Se crea una plantilla con los datos de la persona, caracteristicas fisicas y aporte calorico necesario.

(deftemplate persona 
	(multislot nombre (type SYMBOL) (default ?NONE))
	(multislot apellidos (type SYMBOL) (default ?NONE))
	(slot edad (type INTEGER) (range 0 99) (default ?NONE))
	(slot sexo (type SYMBOL) (allowed-symbols hombre mujer) (default ?NONE))
	(slot peso (type FLOAT) (default ?NONE))
	(slot actividad (type SYMBOL) (allowed-symbols reposo ligera moderada intensa)(default ligera))
	(slot objetivo (type SYMBOL) (allowed-symbols mantener reducir)(default mantener))
	(slot req_cal_dia (type FLOAT))
	(slot gead (type FLOAT))			; gead : "gasto energetico actividad diaria"
	(slot geb (type FLOAT))			    ; geb  : "gasto energetico basal"
	(slot tot_grasas (type FLOAT))
	(slot tot_hidratos(type FLOAT))
	(slot tot_proteinas (type FLOAT))
	(slot tot_calorias (type FLOAT))
	(slot grasas_dia (type FLOAT))
	(slot hidratos_dia (type FLOAT))
	(slot proteinas_dia (type FLOAT))	
	(slot calorias_dia (type FLOAT))	
)

; Se crea otra plantilla con los datos de los alimentos, con sus aportes energeticos y con campos de control para ver si han
; sido usados o si han sido creadas raciones de los mismos.

(deftemplate alimento
	(slot grupo (type INTEGER))
	(slot nombre (type SYMBOL))
	(slot racion (type INTEGER))
	(slot hidratos (type FLOAT))
	(slot proteinas (type FLOAT))
	(slot grasas (type FLOAT))
	(slot calorias (type FLOAT))
	(slot usado (type SYMBOL) (allowed-symbols si no) (default no))
	(slot racionado (type SYMBOL) (allowed-symbols si no) (default si)) 
)

; Tipo enumerado cuya unica funcion es la de indicar el dia de la semana.

(deftemplate dia
	(slot dia_semana (type SYMBOL) (allowed-symbols lunes martes miercoles jueves viernes sabado domingo) (default lunes))
	)

; A continuacion se añaden hechos iniciales que seran cargados por el programa.

(deffacts inicial
	(fase pedir_nombre)	
)

(deffacts dia_actual
	(dia (dia_semana lunes))
	)
	
;Base de datos de alimentos disponibles para generar las dietas
;con las caracteristicas definidas anteriormente en la plantilla.

(deffacts base_datos_alimentos

							; ***** ALIMENTOS DEL GRUPO 1 *****

	(alimento (grupo 1) (nombre leche_entera)               (racion 200)	(hidratos 9.2)  (proteinas 6.4)   (grasas 7.4)   (calorias 129.0)	(racionado no))	
	(alimento (grupo 1) (nombre leche_desnatada) 		(racion 200)	(hidratos 9.4)  (proteinas 6.8)   (grasas 0.4)   (calorias 68.4)	(racionado no))
	(alimento (grupo 1) (nombre cola_cao_energy) 		(racion 200)	(hidratos 24.0) (proteinas 5.8)   (grasas 1.5)   (calorias 132.7)	(racionado no))
	(alimento (grupo 1) (nombre yogur_desnatado) 		(racion 125)	(hidratos 5.0)  (proteinas 4.1)   (grasas 1.1)   (calorias 46.5)	(racionado no))
	(alimento (grupo 1) (nombre queso_camembert) 		(racion 50)	(hidratos 0.45) (proteinas 10.25) (grasas 12.85) (calorias 158.5)	(racionado no))
	(alimento (grupo 1) (nombre yogur_con_frutas) 	        (racion 125)	(hidratos 15.75)(proteinas 4.1)   (grasas 4.1)   (calorias 116.5)	(racionado no))
	(alimento (grupo 1) (nombre queso_parmesano) 		(racion 50)	(hidratos 0.0)  (proteinas 18.0)  (grasas 12.8)  (calorias 187.2)	(racionado no))
	(alimento (grupo 1) (nombre queso_roquefort) 		(racion 50)	(hidratos 1.0)  (proteinas 11.5)  (grasas 17.5)  (calorias 207.5)	(racionado no))
	(alimento (grupo 1) (nombre queso_manchego_curado) 	(racion 50)	(hidratos 0.5)  (proteinas 16.0)  (grasas 16.0)  (calorias 210.0)	(racionado no))
	(alimento (grupo 1) (nombre requeson) 		        (racion 100)	(hidratos 1.4)  (proteinas 13.6)  (grasas 4.0)   (calorias 96.0)	(racionado no))
	(alimento (grupo 1) (nombre crema_leche_pasterizada)    (racion 80)	(hidratos 1.6)  (proteinas 1.6)   (grasas 26.4)  (calorias 250.4)	(racionado no))
	(alimento (grupo 1) (nombre crema_leche_chantilly) 	(racion 80)	(hidratos 8.0)  (proteinas 1.6)   (grasas 24.8)  (calorias 261.6)	(racionado no))
	(alimento (grupo 1) (nombre flan_de_huevo) 	        (racion 125)	(hidratos 27.5) (proteinas 6.25)  (grasas 2.5)   (calorias 157.5)	(racionado no))
	(alimento (grupo 1) (nombre cuajada) 		        (racion 150)	(hidratos 9.0)  (proteinas 7.5)   (grasas 7.5)   (calorias 133.5)	(racionado no))
	(alimento (grupo 1) (nombre queso_de_Burgos) 		(racion 75)	(hidratos 1.8)  (proteinas 8.25)  (grasas 8.25)  (calorias 114.45)      (racionado no))
	(alimento (grupo 1) (nombre quesitos) 		        (racion 60)	(hidratos 0.6)  (proteinas 10.8)  (grasas 13.8)  (calorias 169.8)	(racionado no))
	;(alimento (grupo 1) (nombre queso_quark) 	        (racion 50)	(hidratos 1.5)  (proteinas 5.5)   (grasas 5.5)   (calorias 77.5)	(racionado no))
	;(alimento (grupo 1) (nombre queso_de_cabra) 		(racion 50)	(hidratos 1.0)  (proteinas 8.5)   (grasas 9.0)   (calorias 119.0)	(racionado no))
	;(alimento (grupo 1) (nombre queso_gouda) 	        (racion 50)	(hidratos 0.0)  (proteinas 12.5)  (grasas 13.5)  (calorias 171.5)	(racionado no))
	;(alimento (grupo 1) (nombre yogur_entero) 	        (racion 125)	(hidratos 5.0)  (proteinas 4.1)   (grasas 4.4)   (calorias 76.25)	(racionado no))
	;(alimento (grupo 1) (nombre yogur_natural) 		(racion 125)	(hidratos 7.5) 	(proteinas 6.25)  (grasas 5.0)   (calorias 100.0)	(racionado no))
	;(alimento (grupo 1) (nombre yogur_liquido) 		(racion 125)	(hidratos 13.75)(proteinas 3.75)  (grasas 2.5)   (calorias 92.5)	(racionado no))
	;(alimento (grupo 1) (nombre yogur_con_nata) 		(racion 125)	(hidratos 5.0) 	(proteinas 5.0)   (grasas 5.0)   (calorias 85.0)	(racionado no))	
	;(alimento (grupo 1) (nombre queso_cheddar) 		(racion 50)	(hidratos 0.25) (proteinas 12.5)  (grasas 15.5)  (calorias 190.5)	(racionado no))
	;(alimento (grupo 1) (nombre queso_edam) 	        (racion 50)	(hidratos 0.5)  (proteinas 13.0)  (grasas 11.0)  (calorias 153.0)	(racionado no))
	;(alimento (grupo 1) (nombre queso_emmental) 		(racion 50)	(hidratos 1.8)  (proteinas 14.25) (grasas 15.3)  (calorias 202.0)	(racionado no))
	;(alimento (grupo 1) (nombre queso_de_oveja) 		(racion 50)	(hidratos 0.0)  (proteinas 14.1)  (grasas 14.75) (calorias 189.1)	(racionado no))
	;(alimento (grupo 1) (nombre queso_gruyere) 		(racion 50)	(hidratos 0.75) (proteinas 14.5)  (grasas 15.0)  (calorias 196.0)	(racionado no))
	;(alimento (grupo 1) (nombre nata) 		        (racion 30)	(hidratos 1.0)  (proteinas 0.7)   (grasas 10.5)  (calorias 101.3)	(racionado no))
	;(alimento (grupo 1) (nombre queso_brie) 	        (racion 100)	(hidratos 1.7)  (proteinas 17.0)  (grasas 21.0)  (calorias 263.8)	(racionado no))
	;(alimento (grupo 1) (nombre leche_semidesnatada) 	(racion 200)	(hidratos 10.0) (proteinas 7.0)   (grasas 3.6)   (calorias 100.4)	(racionado no))
	;(alimento (grupo 1) (nombre queso_pirineos) 		(racion 50)	(hidratos 0.0)  (proteinas 11.0)  (grasas 15.0)  (calorias 179.0)	(racionado no))
	;(alimento (grupo 1) (nombre queso_azul) 	        (racion 50)	(hidratos 0.0)  (proteinas 11.5)  (grasas 14.5)  (calorias 176.5)	(racionado no))
	;(alimento (grupo 1) (nombre mozzarella) 	        (racion 100)	(hidratos 4.9)  (proteinas 19.9)  (grasas 16.1)  (calorias 244.1)	(racionado no))
	
							; ***** ALIMENTOS DEL GRUPO 2 *****
							
	(alimento (grupo 2) (nombre bistec_ternera) 		(racion 150)	(hidratos 0.75) (proteinas 31.0)  (grasas 1.5)   (calorias 140.5)	(racionado no))
	(alimento (grupo 2) (nombre emperador) 		        (racion 180)	(hidratos 0.0)  (proteinas 34.2)  (grasas 7.2)   (calorias 201.6)	(racionado no))
	(alimento (grupo 2) (nombre cabrito_asado) 		(racion 150)	(hidratos 1.0)  (proteinas 28.8)  (grasas 38.25) (calorias 436.5)	(racionado no))
	(alimento (grupo 2) (nombre salmon) 		        (racion 180)	(hidratos 0.0)  (proteinas 33.1)  (grasas 21.6)  (calorias 326.8)	(racionado no))
	(alimento (grupo 2) (nombre pollo_frito_kentucky) 	(racion 150)	(hidratos 7.5)  (proteinas 19.5)  (grasas 13.5)  (calorias 229.5)	(racionado no))
	(alimento (grupo 2) (nombre trucha) 			(racion 180)	(hidratos 0.0)  (proteinas 28.8)  (grasas 5.4)   (calorias 163.8)	(racionado no))
	(alimento (grupo 2) (nombre codorniz) 		        (racion 150)	(hidratos 0.0)  (proteinas 37.5)  (grasas 10.2)  (calorias 241.8)	(racionado no))
	(alimento (grupo 2) (nombre bacalao) 			(racion 180)	(hidratos 0.0)  (proteinas 52.2)  (grasas 1.25)  (calorias 220.0)	(racionado no))
	(alimento (grupo 2) (nombre conejo) 			(racion 150)	(hidratos 0.0)  (proteinas 31.8)  (grasas 9.9)   (calorias 216.3)	(racionado no))
	(alimento (grupo 2) (nombre sardinas) 			(racion 150)	(hidratos 1.5)  (proteinas 22.5)  (grasas 6.6)   (calorias 155.4)	(racionado no))
	(alimento (grupo 2) (nombre paletilla_de_cordero) 	(racion 150)	(hidratos 0.0)  (proteinas 24.0)  (grasas 42.0)  (calorias 474.0)	(racionado no))
	(alimento (grupo 2) (nombre mero) 		        (racion 180)	(hidratos 1.1)  (proteinas 32.2)  (grasas 1.3)   (calorias 144.9)	(racionado no))
	(alimento (grupo 2) (nombre sesos_de_cordero) 		(racion 150)	(hidratos 0.0)  (proteinas 15.0)  (grasas 12.0)  (calorias 168.0)	(racionado no))
	(alimento (grupo 2) (nombre mejillones) 	        (racion 100)	(hidratos 3.4)  (proteinas 11.7)  (grasas 2.7)   (calorias 84.7)	(racionado no))
	(alimento (grupo 2) (nombre faisan_al_horno) 		(racion 150)	(hidratos 0.0)  (proteinas 36.4)  (grasas 7.8)   (calorias 215.8)	(racionado no))
	(alimento (grupo 2) (nombre lubina) 		        (racion 180)	(hidratos 1.1)  (proteinas 29.9)  (grasas 2.7)   (calorias 148.3)	(racionado no))
	(alimento (grupo 2) (nombre higado_de_cerdo) 		(racion 150)	(hidratos 2.25) (proteinas 34.2)  (grasas 7.2)   (calorias 210.6)	(racionado no))
	(alimento (grupo 2) (nombre lenguado) 		        (racion 180)	(hidratos 1.4)  (proteinas 30.4)  (grasas 3.0)   (calorias 154.2)	(racionado no))
	(alimento (grupo 2) (nombre liebre) 			(racion 150)	(hidratos 0.0)  (proteinas 34.2)  (grasas 4.8)   (calorias 180.0)	(racionado no))
	(alimento (grupo 2) (nombre gambas) 			(racion 100)	(hidratos 2.9)  (proteinas 13.6)  (grasas 0.6)   (calorias 71.4)	(racionado no))
	(alimento (grupo 2) (nombre pechuga_de_pavo) 		(racion 150)	(hidratos 0.6)  (proteinas 36.4)  (grasas 7.3)   (calorias 213.7)	(racionado no))
	(alimento (grupo 2) (nombre dorada) 		        (racion 180)	(hidratos 0.0)  (proteinas 35.6)  (grasas 2.2)   (calorias 162.2)	(racionado no))
	(alimento (grupo 2) (nombre perdiz) 		        (racion 150)	(hidratos 0.75) (proteinas 37.5)  (grasas 3.1)   (calorias 180.9)	(racionado no))
	(alimento (grupo 2) (nombre arenques) 		        (racion 200)	(hidratos 0.0)  (proteinas 35.4)  (grasas 23.0)  (calorias 348.6)	(racionado no))
	(alimento (grupo 2) (nombre pechuga_de_pollo) 		(racion 130)	(hidratos 0.0)  (proteinas 29.1)  (grasas 2.7)   (calorias 140.7)	(racionado no))
	(alimento (grupo 2) (nombre anchoas_enlatadas) 		(racion 40)     (hidratos 0.0)  (proteinas 8.8)   (grasas 5.2)   (calorias 82.0)	(racionado no))
	(alimento (grupo 2) (nombre hamburguesas_de_vacuno)     (racion 150)	(hidratos 7.5)  (proteinas 22.5)  (grasas 30.0)  (calorias 390.0)	(racionado no))
	(alimento (grupo 2) (nombre almejas) 			(racion 65)     (hidratos 1.4)  (proteinas 6.6)   (grasas 1.6)   (calorias 46.4)	(racionado no))
	(alimento (grupo 2) (nombre jamon_cocido) 	        (racion 150)	(hidratos 1.5)  (proteinas 33.0)  (grasas 43.5)  (calorias 529.5)	(racionado no))
	(alimento (grupo 2) (nombre riñones_de_cordero) 	(racion 150)	(hidratos 0.0)  (proteinas 24.0)  (grasas 4.5)   (calorias 136.5)	(racionado no))
	(alimento (grupo 2) (nombre salami) 			(racion 150)	(hidratos 3.0)  (proteinas 28.5)  (grasas 67.5)  (calorias 733.5)	(racionado no))
	(alimento (grupo 2) (nombre salchichas_de_francfort)    (racion 135)	(hidratos 4.0)  (proteinas 13.5)  (grasas 33.7)  (calorias 373.3)	(racionado no))
	;(alimento (grupo 2) (nombre salchichon) 		(racion 150)	(hidratos 3.0)  (proteinas 39.0)  (grasas 57.0)  (calorias 681.0)	(racionado no))
	;(alimento (grupo 2) (nombre sangre_de_vacuno) 		(racion 150)	(hidratos 0.0)  (proteinas 27.0)  (grasas 1.5)   (calorias 121.5)	(racionado no))
	;(alimento (grupo 2) (nombre carne_de_cerdo_magra) 	(racion 150)	(hidratos 0.0)  (proteinas 29.9)  (grasas 10.2)  (calorias 211.4)	(racionado no))
	;(alimento (grupo 2) (nombre carne_de_cerdo_grasa) 	(racion 150)	(hidratos 0.0)  (proteinas 21.75) (grasas 56.0)  (calorias 591.0)	(racionado no))
	;(alimento (grupo 2) (nombre pierna_de_cordero) 	(racion 150)	(hidratos 0.0)  (proteinas 25.6)  (grasas 5.0)   (calorias 147.4)	(racionado no))
	;(alimento (grupo 2) (nombre pato) 			(racion 150)	(hidratos 0.0)  (proteinas 23.8)  (grasas 37.3)  (calorias 430.9)	(racionado no))
	;(alimento (grupo 2) (nombre carne_de_oveja) 		(racion 150)	(hidratos 0.0)  (proteinas 27.0)  (grasas 25.5)  (calorias 337.5)	(racionado no))
	;(alimento (grupo 2) (nombre muslo_de_pavo) 		(racion 150)	(hidratos 0.6)  (proteinas 31.3)  (grasas 16.8)  (calorias 278.8)	(racionado no))
	;(alimento (grupo 2) (nombre carne_de_cordero_magra)    (racion 150)	(hidratos 0.0)  (proteinas 30.0)  (grasas 4.5)   (calorias 160.5)	(racionado no))
	;(alimento (grupo 2) (nombre anguila) 			(racion 180)	(hidratos 0.2)  (proteinas 21.25) (grasas 42.6)  (calorias 469.2)	(racionado no))
	;(alimento (grupo 2) (nombre cordero_lechal) 		(racion 150)	(hidratos 0.0)  (proteinas 31.5)  (grasas 3.6)   (calorias 158.4)	(racionado no))
	;(alimento (grupo 2) (nombre salchichas_de_cerdo) 	(racion 160)	(hidratos 16.0) (proteinas 17.6)  (grasas 51.2)  (calorias 595.2)	(racionado no))
	;(alimento (grupo 2) (nombre salchichas_enlatadas) 	(racion 160)	(hidratos 0.0)  (proteinas 20.8)  (grasas 32.0)  (calorias 371.2)	(racionado no))
	;(alimento (grupo 2) (nombre atun_fresco) 		(racion 100)	(hidratos 0.0)  (proteinas 21.5)  (grasas 8.0)   (calorias 158.0)	(racionado no))	
	;(alimento (grupo 2) (nombre berberechos_cocidos) 	(racion 100)	(hidratos 0.0)  (proteinas 11.0)  (grasas 0.0)   (calorias 44.0)	(racionado no))
	;(alimento (grupo 2) (nombre boquerones) 	        (racion 180)	(hidratos 2.7)  (proteinas 30.25) (grasas 4.7)   (calorias 174.1)	(racionado no))
	;(alimento (grupo 2) (nombre riñones_de_vacuno) 	(racion 150)	(hidratos 0.0)  (proteinas 24.0)  (grasas 4.5)   (calorias 136.5)	(racionado no))
	;(alimento (grupo 2) (nombre caballa) 			(racion 180)	(hidratos 0.0)  (proteinas 30.6)  (grasas 20.0)  (calorias 302.4)	(racionado no))
	;(alimento (grupo 2) (nombre muslo_de_pollo) 		(racion 130)	(hidratos 0.0)  (proteinas 25.5)  (grasas 7.4)   (calorias 168.6)	(racionado no))
	;(alimento (grupo 2) (nombre calamar) 			(racion 150)	(hidratos 1.0)  (proteinas 18.9)  (grasas 2.5)   (calorias 102.1)	(racionado no))
	;(alimento (grupo 2) (nombre jamon_serrano) 		(racion 150)	(hidratos 0.0)  (proteinas 46.5)  (grasas 10.5)  (calorias 280.5)	(racionado no))
	;(alimento (grupo 2) (nombre gallo) 			(racion 180)	(hidratos 2.2)  (proteinas 29.2)  (grasas 1.6)   (calorias 140.0)	(racionado no))
	;(alimento (grupo 2) (nombre sesos_de_cerdo) 		(racion 150)	(hidratos 0.0)  (proteinas 16.5)  (grasas 13.5)  (calorias 187.5)	(racionado no))
	;(alimento (grupo 2) (nombre langosta) 		        (racion 100)	(hidratos 1.0)  (proteinas 16.2)  (grasas 1.9)   (calorias 85.9)	(racionado no))
	;(alimento (grupo 2) (nombre sesos_de_ternera) 		(racion 150)	(hidratos 0.0)  (proteinas 15.0)  (grasas 12.0)  (calorias 168.0)	(racionado no))
	;(alimento (grupo 2) (nombre lucio) 			(racion 180)	(hidratos 0.0)  (proteinas 32.4)  (grasas 1.1)   (calorias 139.5)	(racionado no))
	;(alimento (grupo 2) (nombre higado_de_vacuno) 		(racion 150)	(hidratos 1.3)  (proteinas 31.5)  (grasas 6.6)   (calorias 190.6)	(racionado no))
	;(alimento (grupo 2) (nombre higado_de_pollo) 		(racion 150)	(hidratos 1.5)  (proteinas 28.5)  (grasas 9.0)   (calorias 201.0)	(racionado no))
	;(alimento (grupo 2) (nombre carne_de_jabali) 	  	(racion 150)	(hidratos 0.6)  (proteinas 31.5)  (grasas 3.0)   (calorias 155.4)	(racionado no))
	;(alimento (grupo 2) (nombre lacon) 			(racion 150)	(hidratos 0.0)  (proteinas 28.8)  (grasas 47.4)  (calorias 541.8)	(racionado no))
	;(alimento (grupo 2) (nombre merluza) 		        (racion 180)	(hidratos 0.0)  (proteinas 30.6)  (grasas 0.5)   (calorias 126.9)	(racionado no))
	;(alimento (grupo 2) (nombre pez_espada) 		(racion 180)	(hidratos 1.8)  (proteinas 30.4)  (grasas 7.6)   (calorias 197.2)	(racionado no))
	;(alimento (grupo 2) (nombre pulpo) 		        (racion 100)	(hidratos 1.4)  (proteinas 10.6)  (grasas 1.0)   (calorias 57.0)	(racionado no))
	;(alimento (grupo 2) (nombre rodaballo) 		(racion 180)	(hidratos 2.2)  (proteinas 29.3)  (grasas 2.3)   (calorias 146.7)	(racionado no))
	;(alimento (grupo 2) (nombre salmonete) 		(racion 100)	(hidratos 1.1)  (proteinas 15.8)  (grasas 6.2)   (calorias 123.4)	(racionado no))
	;(alimento (grupo 2) (nombre carne_de_ciervo) 		(racion 150)	(hidratos 0.9)  (proteinas 30.5)  (grasas 5.5) 	 (calorias 175.1)	(racionado no))
	;(alimento (grupo 2) (nombre sepia) 		        (racion 150)	(hidratos 1.0)  (proteinas 21.0)  (grasas 2.25)  (calorias 108.2)	(racionado no))
	
							; ***** ALIMENTOS DEL GRUPO 3 *****
	
	(alimento (grupo 3) (nombre patatas_cocidas) 		(racion 250)	(hidratos 52.5)  (proteinas 5.0)  (grasas 0.0)   (calorias 230.0)	(racionado no))
	(alimento (grupo 3) (nombre patatas_fritas) 		(racion 200)	(hidratos 74.0)  (proteinas 8.0)  (grasas 22.0)  (calorias 526.0)	(racionado no))
	(alimento (grupo 3) (nombre piñones) 		        (racion 100)	(hidratos 5.0)   (proteinas 29.6) (grasas 47.8)  (calorias 568.6)	(racionado no))
	(alimento (grupo 3) (nombre garbanzos_cocidos) 		(racion 70)	(hidratos 38.0)  (proteinas 15.3) (grasas 3.4) 	 (calorias 243.8)	(racionado no))
	(alimento (grupo 3) (nombre guisantes_secos) 		(racion 100)	(hidratos 53.6)  (proteinas 24.3) (grasas 1.8)   (calorias 327.8)	(racionado no))
	(alimento (grupo 3) (nombre habas_secas) 	        (racion 90)	(hidratos 41.85) (proteinas 27.0) (grasas 2.4)   (calorias 297.0)	(racionado no))
	(alimento (grupo 3) (nombre lentejas) 			(racion 90)	(hidratos 48.6)  (proteinas 22.5) (grasas 2.25)  (calorias 304.65)	(racionado no))
	(alimento (grupo 3) (nombre alubias) 			(racion 70)     (hidratos 42.7)  (proteinas 16.1) (grasas 0.9)   (calorias 243.3)	(racionado no))
	(alimento (grupo 3) (nombre almendras) 			(racion 100)	(hidratos 4.0)   (proteinas 16.0) (grasas 51.4)  (calorias 542.6)	(racionado no))
	(alimento (grupo 3) (nombre uvas_pasas) 		(racion 100)	(hidratos 72.0)  (proteinas 1.9)  (grasas 0.6)   (calorias 301.0)	(racionado no))
	(alimento (grupo 3) (nombre avellanas) 		        (racion 100)	(hidratos 1.8)   (proteinas 13.0) (grasas 62.9)  (calorias 625.3)	(racionado no))
	(alimento (grupo 3) (nombre cacahuetes) 		(racion 100)	(hidratos 35.0)  (proteinas 20.4) (grasas 25.6)  (calorias 452.0)	(racionado no))
	(alimento (grupo 3) (nombre castañas) 			(racion 100)	(hidratos 89.0)  (proteinas 4.7)  (grasas 3.0)   (calorias 401.8)	(racionado no))
	(alimento (grupo 3) (nombre ciruelas_pasas) 		(racion 100)	(hidratos 43.7)  (proteinas 2.2)  (grasas 0.5)   (calorias 188.1)	(racionado no))
	(alimento (grupo 3) (nombre higos_secos) 		(racion 100)	(hidratos 66.6)  (proteinas 3.5)  (grasas 2.7)   (calorias 304.7)	(racionado no))
	(alimento (grupo 3) (nombre nueces) 			(racion 100)	(hidratos 11.2)  (proteinas 15.6) (grasas 63.3)  (calorias 676.9)	(racionado no))
	(alimento (grupo 3) (nombre pipas_de_girasol) 		(racion 100)	(hidratos 14.0)  (proteinas 22.0) (grasas 50.0)  (calorias 594.0)	(racionado no))
	(alimento (grupo 3) (nombre pistachos) 		        (racion 100)	(hidratos 13.0)  (proteinas 21.0) (grasas 52.0)  (calorias 604.0)	(racionado no))

							; ***** ALIMENTOS DEL GRUPO 4 *****
	
	(alimento (grupo 4) (nombre ajos)			(racion 10)	(hidratos 2.6)   (proteinas 0.6)  (grasas 0.1)   (calorias 13.7)	(racionado si))
	(alimento (grupo 4) (nombre alcachofas)			(racion 130)	(hidratos 3.0)   (proteinas 1.8)  (grasas 0.3)   (calorias 21.9)	(racionado no))
	(alimento (grupo 4) (nombre berenjenas)		        (racion 270)	(hidratos 7.0)   (proteinas 3.0)  (grasas 0.3)   (calorias 42.7)	(racionado no))
	(alimento (grupo 4) (nombre repollo)			(racion 250)	(hidratos 6.25)  (proteinas 5.25) (grasas 0.25)  (calorias 48.25)	(racionado no))
	(alimento (grupo 4) (nombre berros)			(racion 200)	(hidratos 3.2)   (proteinas 4.8)  (grasas 0.4)   (calorias 35.6)	(racionado no))
	(alimento (grupo 4) (nombre zanahoria)			(racion 250)	(hidratos 19.5)  (proteinas 2.5)  (grasas 0.5)   (calorias 92.5)	(racionado no))
	(alimento (grupo 4) (nombre calabacin)		        (racion 150)	(hidratos 2.1)   (proteinas 1.95) (grasas 0.15)  (calorias 17.55)	(racionado no))
	(alimento (grupo 4) (nombre puerros)			(racion 250)	(hidratos 15.0)  (proteinas 5.25) (grasas 0.25)  (calorias 83.25)	(racionado no))
	(alimento (grupo 4) (nombre cebolla)			(racion 150)	(hidratos 7.8)   (proteinas 1.5)  (grasas 0.0)   (calorias 37.2)	(racionado no))
	(alimento (grupo 4) (nombre coles_de_bruselas)		(racion 200)	(hidratos 8.6)   (proteinas 8.4)  (grasas 1.0)   (calorias 77.0)	(racionado no))
	(alimento (grupo 4) (nombre coliflor)			(racion 200)	(hidratos 5.4)   (proteinas 6.4)  (grasas 0.4)   (calorias 50.8)	(racionado no))
	(alimento (grupo 4) (nombre esparragos)			(racion 150)	(hidratos 4.35)  (proteinas 5.4)  (grasas 0.3)   (calorias 41.7)	(racionado no))
	(alimento (grupo 4) (nombre espinacas)		        (racion 250)	(hidratos 7.5)   (proteinas 8.5)  (grasas 1.75)  (calorias 79.75)	(racionado no))
	(alimento (grupo 4) (nombre guisantes_frescos)		(racion 200)	(hidratos 21.2)  (proteinas 14.0) (grasas 0.4)   (calorias 144.4)	(racionado no))
	(alimento (grupo 4) (nombre habas_frescas)		(racion 250)	(hidratos 19.25) (proteinas 10.25)(grasas 2.0)   (calorias 136.0)	(racionado no))
	(alimento (grupo 4) (nombre lechuga)			(racion 200)	(hidratos 4.4)   (proteinas 3.6)  (grasas 0.8)   (calorias 39.2)	(racionado no))
	(alimento (grupo 4) (nombre nabo)			(racion 250)	(hidratos 8.25)  (proteinas 2.5)  (grasas 0.0)   (calorias 43.0)	(racionado no))
	(alimento (grupo 4) (nombre pepino)			(racion 200)	(hidratos 4.0)   (proteinas 1.4)  (grasas 0.2)   (calorias 23.4)	(racionado no))
	(alimento (grupo 4) (nombre remolacha)			(racion 200)	(hidratos 16.4)  (proteinas 3.0)  (grasas 0.2)   (calorias 79.4)	(racionado no))
	(alimento (grupo 4) (nombre setas_boletus)              (racion 100)	(hidratos 0.0)   (proteinas 3.0)  (grasas 0.0)   (calorias 12.0)	(racionado no))
	(alimento (grupo 4) (nombre tomate)			(racion 200)	(hidratos 5.8)   (proteinas 2.0)  (grasas 0.4)   (calorias 34.8)	(racionado no))
	(alimento (grupo 4) (nombre apio)			(racion 200)	(hidratos 8.4)   (proteinas 4.6)  (grasas 0.4)   (calorias 55.6)	(racionado no))
	;(alimento (grupo 4) (nombre cardo)		        (racion 200)	(hidratos 3.4)   (proteinas 1.2)  (grasas 0.2)   (calorias 20.2)	(racionado no))
	;(alimento (grupo 4) (nombre calabaza)		        (racion 150)	(hidratos 5.25)  (proteinas 1.65) (grasas 0.15)  (calorias 28.95)	(racionado no))
	;(alimento (grupo 4) (nombre brecol)			(racion 200)	(hidratos 8.0)   (proteinas 6.6)  (grasas 0.4)   (calorias 62.0)	(racionado no))
	;(alimento (grupo 4) (nombre trufa)			(racion 250)	(hidratos 1.8)   (proteinas 15.0) (grasas 1.25)  (calorias 78.45)	(racionado no))

							; ***** ALIMENTOS DEL GRUPO 5 *****
	
	(alimento (grupo 5) (nombre platano)		        (racion 160)	(hidratos 31.2)  (proteinas 1.9)  (grasas 0.5)   (calorias 136.9)	(racionado no))
	(alimento (grupo 5) (nombre aguacates)			(racion 200)	(hidratos 6.4)   (proteinas 3.8)  (grasas 47.0)  (calorias 463.8)	(racionado no))
	(alimento (grupo 5) (nombre albaricoques)	        (racion 200)	(hidratos 25.0)  (proteinas 0.8)  (grasas 0.2)   (calorias 105.0)	(racionado no))
	(alimento (grupo 5) (nombre manzana)			(racion 200)	(hidratos 20.8)  (proteinas 0.4)  (grasas 0.6)   (calorias 90.2)	(racionado no))
	(alimento (grupo 5) (nombre arandanos)			(racion 100)	(hidratos 10.1)  (proteinas 0.6)  (grasas 0.4)   (calorias 46.4)	(racionado no))
	(alimento (grupo 5) (nombre cerezas)			(racion 100)	(hidratos 11.7)  (proteinas 0.8)  (grasas 0.1)   (calorias 50.9)	(racionado no))
	(alimento (grupo 5) (nombre ciruelas)			(racion 225)	(hidratos 20.0)  (proteinas 1.1)  (grasas 0.2)   (calorias 86.2)	(racionado no))
	(alimento (grupo 5) (nombre uvas)			(racion 200)	(hidratos 31.2)  (proteinas 1.0)  (grasas 0.2)   (calorias 130.6)	(racionado no))
	(alimento (grupo 5) (nombre frambuesas)			(racion 100)	(hidratos 5.6)   (proteinas 1.0)  (grasas 0.6)   (calorias 31.8)	(racionado no))
	(alimento (grupo 5) (nombre fresas)			(racion 85)	(hidratos 4.8)   (proteinas 0.8)  (grasas 0.3)   (calorias 25.1)	(racionado no))
	(alimento (grupo 5) (nombre higos_frescos)	        (racion 120)	(hidratos 13.4)  (proteinas 1.1)  (grasas 0.2)   (calorias 59.8)	(racionado no))
	(alimento (grupo 5) (nombre mandarinas)			(racion 180)	(hidratos 16.4)  (proteinas 1.3)  (grasas 0.7)   (calorias 77.1)	(racionado no))
	(alimento (grupo 5) (nombre melocoton)		        (racion 200)	(hidratos 13.8)	 (proteinas 1.6)  (grasas 0.2)   (calorias 63.4)	(racionado no))
	(alimento (grupo 5) (nombre granada)			(racion 275)	(hidratos 43.7)  (proteinas 1.4)  (grasas 0.3)   (calorias 183.1)	(racionado no))
	(alimento (grupo 5) (nombre melon)			(racion 250)	(hidratos 18.5)  (proteinas 2.0)  (grasas 0.5)   (calorias 86.5)	(racionado no))
	(alimento (grupo 5) (nombre naranja)		        (racion 225)	(hidratos 39.4)  (proteinas 2.25) (grasas 0.45)  (calorias 170.65)	(racionado no))
	(alimento (grupo 5) (nombre piña)			(racion 160)	(hidratos 20.3)  (proteinas 0.8)  (grasas 0.3)   (calorias 87.1) 	(racionado no))
	(alimento (grupo 5) (nombre pera)			(racion 200)	(hidratos 4.0)   (proteinas 1.4)  (grasas 0.2)   (calorias 23.4)	(racionado no))
	(alimento (grupo 5) (nombre pomelo)			(racion 375)	(hidratos 23.25) (proteinas 2.25) (grasas 0.0)   (calorias 106.0)	(racionado no))
	(alimento (grupo 5) (nombre sandia)			(racion 200)	(hidratos 7.4)   (proteinas 1.4)  (grasas 0.0)   (calorias 35.2)	(racionado no))	
	;(alimento (grupo 5) (nombre mango)			(racion 200)	(hidratos 33.6)  (proteinas 1.4)  (grasas 0.8)   (calorias 147.2)	(racionado no))

							;***** ALIMENTOS DEL GRUPO 6 *****
	
	(alimento (grupo 6) (nombre cereales_cornflakes)	(racion 100)	(hidratos 85.0)  (proteinas 9.0)  (grasas 2.0)   (calorias 394.0)	(racionado no))
	(alimento (grupo 6) (nombre arroz)			(racion 100)	(hidratos 87.6)  (proteinas 7.0)  (grasas 0.6)   (calorias 383.8)	(racionado no))
	(alimento (grupo 6) (nombre biscotes_de_trigo)		(racion 100)	(hidratos 73.0)  (proteinas 9.0)  (grasas 4.0)   (calorias 364.0)	(racionado no))
	(alimento (grupo 6) (nombre galleta_maria)	        (racion 100)	(hidratos 82.3)  (proteinas 6.8)  (grasas 8.1)   (calorias 429.3)	(racionado no))
	(alimento (grupo 6) (nombre pan_integral)		(racion 50)	(hidratos 23.75) (proteinas 4.5)  (grasas 0.5)   (calorias 117.5)	(racionado no))
	(alimento (grupo 6) (nombre pasta_de_semola)		(racion 100)	(hidratos 78.6)  (proteinas 13.0) (grasas 0.3)   (calorias 369.1)	(racionado no))				
	(alimento (grupo 6) (nombre macarrones)			(racion 100)	(hidratos 79.0)  (proteinas 14.0) (grasas 2.0)   (calorias 390.0)	(racionado no))
	(alimento (grupo 6) (nombre cereales_muesli)		(racion 100)	(hidratos 66.0)  (proteinas 13.0) (grasas 8.0)   (calorias 388.0)	(racionado no))
	(alimento (grupo 6) (nombre mazapan)			(racion 100)	(hidratos 49.0)  (proteinas 9.0)  (grasas 25.0)  (calorias 457.0)	(racionado no))
	(alimento (grupo 6) (nombre pan_blanco)		        (racion 100)	(hidratos 64.0)  (proteinas 8.1)  (grasas 0.5)   (calorias 292.9)	(racionado no))
	(alimento (grupo 6) (nombre pan_tostado)		(racion 50)	(hidratos 41.5)  (proteinas 5.65) (grasas 3.0)   (calorias 215.6)	(racionado no))
	(alimento (grupo 6) (nombre pasta_al_huevo)	        (racion 100)	(hidratos 73.4)  (proteinas 19.0) (grasas 0.2)   (calorias 371.4)	(racionado no))
	(alimento (grupo 6) (nombre semola)			(racion 100)	(hidratos 77.6)  (proteinas 11.5) (grasas 0.5)   (calorias 360.9)	(racionado no))
	(alimento (grupo 6) (nombre tapioca)			(racion 100)	(hidratos 86.4)  (proteinas 0.6)  (grasas 0.2)   (calorias 349.8)	(racionado no))
	(alimento (grupo 6) (nombre batido_de_chocolate)	(racion 100)	(hidratos 77.0)  (proteinas 6.0)  (grasas 6.0)   (calorias 386.0)	(racionado no))
	(alimento (grupo 6) (nombre maiz)			(racion 100)	(hidratos 73.0)  (proteinas 9.2)  (grasas 3.8)   (calorias 363.0)	(racionado no))
	(alimento (grupo 6) (nombre chocolate)			(racion 100)	(hidratos 50.8)  (proteinas 8.9)  (grasas 37.9)  (calorias 466.2)	(racionado no))
	(alimento (grupo 6) (nombre miel)			(racion 100)	(hidratos 80.0)  (proteinas 0.6)  (grasas 0.0)   (calorias 322.4)	(racionado no))
	;(alimento (grupo 6) (nombre harina_integral)		(racion 100)    (hidratos 69.7)  (proteinas 11.0) (grasas 1.9)   (calorias 339.9)	(racionado no))
	;(alimento (grupo 6) (nombre bombones)			(racion 100)	(hidratos 66.0)  (proteinas 5.0)  (grasas 21.0)  (calorias 473.0)	(racionado no))
	;(alimento (grupo 6) (nombre azucar_morena)		(racion 100)	(hidratos 96.0)  (proteinas 0.0)  (grasas 0.0)   (calorias 384.0)	(racionado no))
	;(alimento (grupo 6) (nombre harina)			(racion 100)	(hidratos 73.6)  (proteinas 11.0) (grasas 0.7)   (calorias 344.7)	(racionado no))
	;(alimento (grupo 6) (nombre azucar_blanca)	        (racion 100)	(hidratos 100.0) (proteinas 0.0)  (grasas 0.0)   (calorias 400.0)	(racionado no))

							; ***** ALIMENTOS DEL GRUPO 7 *****
	
	(alimento (grupo 7) (nombre margarina_de_maiz)		(racion 50)     (hidratos 0.45)   (proteinas 0.45)(grasas 40.0)  (calorias 364.0)	(racionado no))
	(alimento (grupo 7) (nombre mantequilla)		(racion 50)	(hidratos 0.03)   (proteinas 0.4) (grasas 40.6)  (calorias 367.0)	(racionado no))
	(alimento (grupo 7) (nombre manteca_de_cerdo)		(racion 50)	(hidratos 0.0)    (proteinas 0.0) (grasas 49.5)  (calorias 446.0)	(racionado no))	
	(alimento (grupo 7) (nombre aceite_de_coco)	        (racion 50)	(hidratos 0.0)    (proteinas 0.0) (grasas 50.0)  (calorias 450.0)	(racionado no))
	(alimento (grupo 7) (nombre aceite_de_oliva_virgen)	(racion 50)	(hidratos 0.0)    (proteinas 0.0) (grasas 50.0)  (calorias 450.0)	(racionado no))
	(alimento (grupo 7) (nombre aceite_de_girasol)		(racion 50)	(hidratos 0.0)    (proteinas 0.0) (grasas 50.0)  (calorias 450.0)	(racionado no))
	(alimento (grupo 7) (nombre mayonesa_comercial)		(racion 50)	(hidratos 2.9)    (proteinas 0.65)(grasas 37.8)  (calorias 355.0)	(racionado no))
	(alimento (grupo 7) (nombre margarina_ligera)		(racion 50)	(hidratos 0.2)    (proteinas 0.8) (grasas 20.0)  (calorias 184.0)	(racionado no))
	(alimento (grupo 7) (nombre mantequilla_light)		(racion 50)	(hidratos 0.0)    (proteinas 1.7) (grasas 27.6)  (calorias 255.0)	(racionado no))
	;(alimento (grupo 7) (nombre mayonesa_light)		(racion 50)	(hidratos 5.4)    (proteinas 0.5) (grasas 14.1)  (calorias 150.0)	(racionado no))
	;(alimento (grupo 7) (nombre aceite_de_semillas)	(racion 50)	(hidratos 0.0)    (proteinas 0.0) (grasas 50.0)  (calorias 450.0)	(racionado no))
	;(alimento (grupo 7) (nombre margarina_salada)		(racion 50)	(hidratos 0.45)   (proteinas 0.45)(grasas 40.3)  (calorias 366.0)	(racionado no))
)

; Regla para crear raciones de los alimentos de la base de hechos con diferentes cantidades.

(defrule racionar_alimentos 
	(declare (salience  20))
	?alim <- (alimento (grupo ?grupo) (nombre ?nom) (racion ?rac) (hidratos ?hid) (proteinas ?prot) (grasas ?gras) (calorias ?cal) (racionado no))
	=>
	(retract ?alim)
	(assert (alimento (grupo ?grupo) (nombre ?nom) (racion ?rac) (hidratos ?hid) (proteinas ?prot) (grasas ?gras) (calorias ?cal) (racionado si)))
	(assert (alimento (grupo ?grupo) (nombre ?nom) (racion (* ?rac 2)) (hidratos (* ?hid 2)) (proteinas (* ?prot 2)) (grasas (* ?gras 2)) (calorias (* ?cal 2)) (racionado si)))
	(assert (alimento (grupo ?grupo) (nombre ?nom) (racion (/ ?rac 2)) (hidratos (/ ?hid 2)) (proteinas (/ ?prot 2)) (grasas (/ ?gras 2)) (calorias (/ ?cal 2)) (racionado si)))
)

; Regla que elimina de la BC los alimentos que ya han sido usados, independientemente de la cantidad en gramos consumida.

(defrule alimentos-usados
	(declare (salience 10))
	(alimento (nombre ?nom) (usado si))
	?alim <- (alimento (nombre ?n& ?nom) (usado no))
	=>
	(retract ?alim)
)

; A continuacion se definen reglas para obtener los datos de una persona, con su correspondiente tratamiento de errores.

(defrule pedir-nombre
	?fase <- (fase pedir_nombre)
	=>
	(retract ?fase)	
	(printout t "Introduzca el nombre: ")	
	(assert (nombre (explode$ (readline))))
	(assert (fase pedir-apellidos))
)

(defrule pedir-apellidos
	?fase <- (fase pedir-apellidos)	
	=>
	(retract ?fase)
	(printout t "Introduzca los apellidos: ")
	(assert (apellidos (explode$ (readline))))
	(assert (fase pedir-edad))
)

(defrule pedir-edad
	?fase <- (fase pedir-edad)
	=>
	(retract ?fase)
	(printout t "Introduzca la edad (0-99): ")
	(assert (edad (read)))
	(assert	(fase comprobar-edad))
)

(defrule edad-incorrecta
	?fase <- (fase comprobar-edad)
	?edad <- (edad ?e&:
			(or (not (integerp ?e))
				(< ?e 0)
				(> ?e 99)))
	=>
	(retract ?fase)
	(retract ?edad)
	(printout t crlf "Introduzca una edad comprendida entre 0 y 125" crlf crlf)
	(assert (fase pedir-edad))
)

(defrule edad-correcta
	?fase <- (fase comprobar-edad)
	?edad <- (edad ?e&:
			(and (integerp ?e)  
				(> ?e 0)
				(< ?e 99)))
	=>
	(retract ?fase)
	(assert (fase pedir-sexo))
)

(defrule pedir-sexo
	?fase <- (fase pedir-sexo)
	=>
	(retract ?fase)
	(printout t "Elija sexo (hombre/mujer): ")
	(assert (sexo (read)))
	(assert (fase comprobar-sexo))
)

(defrule sexo-incorrecto
	?fase <- (fase comprobar-sexo)
	?sexo <- (sexo ?s & ~hombre & ~mujer)
	=>
	(retract ?fase)
	(retract ?sexo)
	(printout t crlf "Sexo incorrecto. Elija sexo (hombre/mujer): " crlf crlf)
	(assert (fase pedir-sexo))
)
		
(defrule sexo-correcto
	?fase <- (fase comprobar-sexo)
	?sexo <- (sexo ?s & hombre|mujer)
	=>
	(retract ?fase)
	(assert (fase pedir-peso))
)

(defrule pedir-peso
	?fase <- (fase pedir-peso)
	=>
	(retract ?fase)
	(printout t "Introduzca el peso (formato XX.X): ")
	(assert (peso (read)))
	(assert (fase comprobar-peso))
)	

(defrule peso-incorrecto
	?fase <- (fase comprobar-peso)
	?peso <- (peso ?p&:
		(or (not (floatp ?p))
			(< ?p 0)))			
	=>
	(retract ?fase)
	(retract ?peso)
	(printout t crlf "Formato incorrecto." crlf crlf)
	(assert (fase pedir-peso))
)

(defrule peso-correcto
	?fase <- (fase comprobar-peso)
	?peso <- (peso ?p&:
			(and (floatp ?p)
				(> ?p 0)))			
	=>
	(retract ?fase)
	(assert (fase pedir-actividad))
)

(defrule pedir-actividad
	?fase <- (fase pedir-actividad)
	=>
	(retract ?fase)
	(printout t "Elija tipo de actividad (reposo - ligera - moderada - intensa): ")
	(assert (actividad (read)))
	(assert (fase comprobar-actividad))
)

(defrule actividad-incorrecta
	?fase <- (fase comprobar-actividad)
	?actividad <- (actividad ?a& ~reposo & ~ligera & ~moderada & ~intensa)		
	=>
	(retract ?fase)
	(retract ?actividad)
	(printout t crlf "Actividad incorrecta. " crlf crlf)
	(assert (fase pedir-actividad))
)

(defrule actividad-correcta
	?fase <- (fase comprobar-actividad)
	?actividad <- (actividad ?a& reposo|ligera|moderada|intensa)
	=>
	(retract ?fase)
	(assert (fase pedir-objetivo))
)

(defrule pedir-objetivo
	?fase <- (fase pedir-objetivo)
	=>
	(retract ?fase)
	(printout t "Elija el objetivo (mantener - reducir): ")
	(assert (objetivo (read)))
	(assert (fase comprobar-objetivo))
)

(defrule objetivo-incorrecto
	?fase <- (fase comprobar-objetivo)
	?objetivo <- (objetivo ?o&  ~mantener & ~reducir)		
	=>
	(retract ?fase)
	(retract ?objetivo)
	(printout t crlf "Objetivo incorrecto. " crlf crlf)
	(assert (fase pedir-objetivo))
)

(defrule objetivo-correcto
	?fase <- (fase comprobar-objetivo)
	?objetivo <- (objetivo ?o& mantener|reducir)
	=>
	(retract ?fase)
	(assert (fase crear-persona))
	(printout t crlf "Datos correctos. Generando dieta, por favor espere... " crlf crlf)
)

; Cuando todos los datos son correctos se crea la persona a la que se generara la dieta

(defrule nueva-persona
	?fase <- (fase crear-persona)
	?nom <- (nombre $?n)
	?ape <- (apellidos $?ap)
	?eda <- (edad ?e)
	?sex <- (sexo ?s)
	?pes <- (peso ?p)
	?act <- (actividad ?ac)
	?obj <- (objetivo ?o)
	=>
	(retract ?fase ?nom ?ape ?eda ?sex ?pes ?act ?obj)
	(assert (persona (nombre $?n) (apellidos $?ap) (edad ?e) (sexo ?s) (peso ?p) (actividad ?ac) (objetivo ?o)))
	(assert (fase calcula_gead))
)

; Regla para obtener el gasto energetico de una persona en funcion de su actividad

(defrule asigna_gead
	?fase <- (fase calcula_gead)
	?pers <- (persona (actividad ?a) (gead ?gead))
	=>
	(retract ?fase)
	(switch ?a
		(case reposo   then (modify ?pers (gead (+ ?gead 0))))
		(case ligera   then (modify ?pers (gead (+ ?gead 200))))
		(case moderada then (modify ?pers (gead (+ ?gead 400))))
		(case intensa  then (modify ?pers (gead (+ ?gead 1000))))
	)
	(assert (fase calcula_geb))
)

;Regla para calcular el gasto energetico basal de hombres y mujeres menores de 3 annos.

(defrule calcula_gast_energ_basal_hasta_3 
	?fase <- (fase calcula_geb)
	?pers <- (persona (edad ?e) (sexo ?s) (peso ?p) (geb ?g))
	(test (< ?e 3))
	=>
	(retract ?fase)
	(switch ?s
		(case hombre   then (modify ?pers (geb  (+ ?g (* 60.9 ?p) -54))))
		(case mujer    then (modify ?pers (geb  (+ ?g (* 61.0 ?p) -51))))
	)
	(assert (fase req_cal_dia))
)

; Regla para calcular el gasto energetico basal de hombres y mujeres de entre 3 y 10 annos.

(defrule calcula_gast_energ_basal_de_3_a_10
	?fase <- (fase calcula_geb)
	?pers <- (persona (edad ?e) (sexo ?s) (peso ?p) (geb ?g))
	(test (< ?e 10))
	(test (> ?e 2))
	=>
	(retract ?fase)
	(switch ?s
		(case hombre   then (modify ?pers (geb  (+ ?g (* 22.7 ?p) +495))))
		(case mujer    then (modify ?pers (geb  (+ ?g (* 22.5 ?p) +499))))
	)
	(assert (fase req_cal_dia))
)

; Regla para calcular el gasto energetico basal de hombres y mujeres de entre 10 y 18 annos.

(defrule calcula_gast_energ_basal_de_10_a_18

	?fase <- (fase calcula_geb)
	?pers <- (persona (edad ?e) (sexo ?s) (peso ?p) (geb ?g))
	(test (< ?e 18))
	(test (> ?e 9))
	=>
	(retract ?fase)
	(switch ?s
		(case hombre   then (modify ?pers (geb  (+ ?g (* 17.5 ?p) +651))))
		(case mujer    then (modify ?pers (geb  (+ ?g (* 12.2 ?p) +746))))
	)
	(assert (fase req_cal_dia))
)

; Regla para calcular el gasto energetico basal de hombres y mujeres de entre 18 y 30 annos.

(defrule calcula_gast_energ_basal_de_18_a_30
	?fase <- (fase calcula_geb)
	?pers <- (persona (edad ?e) (sexo ?s) (peso ?p) (geb ?g))
	(test (< ?e 30))
	(test (> ?e 17))
	=>
	(retract ?fase)
	(switch ?s
		(case hombre   then (modify ?pers (geb  (+ ?g (* 15.3 ?p) +679))))
		(case mujer    then (modify ?pers (geb  (+ ?g (* 14.7 ?p) +496))))
	)
	(assert (fase req_cal_dia))
)

; Regla para calcular el gasto energetico basal de hombres y mujeres de entre 30 y 60 annos.

(defrule calcula_gast_energ_basal_de_30_a_60
	?fase <- (fase calcula_geb)
	?pers <- (persona (edad ?e) (sexo ?s) (peso ?p) (geb ?g))
	(test (> ?e 29))
	(test (< ?e 60))
	=>
	(retract ?fase)
	(switch ?s
		(case hombre   then (modify ?pers (geb  (+ ?g (* 11.6 ?p) +879))))
		(case mujer    then (modify ?pers (geb  (+ ?g (* 8.7 ?p)  +829))))
	)
	(assert (fase req_cal_dia))
)

; Regla para calcular el gasto energetico basal de hombres y mujeres mayores de 60 annos.

(defrule calcula_gast_energ_basal_mas_de_60 
	?fase <- (fase calcula_geb)
	?pers <- (persona (edad ?e) (sexo ?s) (peso ?p) (geb ?g))
	(test (> ?e 59))
	=>
	(retract ?fase)
	(switch ?s
		(case hombre   then (modify ?pers (geb  (+ ?g (* 13.5 ?p) +487))))
		(case mujer    then (modify ?pers (geb  (+ ?g (* 10.5 ?p) +596))))
	)
	(assert (fase req_cal_dia))
)

; Regla para calcular el requerimiento calorico diario.

(defrule calcula_req_cal_diario
	?fase <- (fase req_cal_dia)
	?pers <- (persona (objetivo ?o) (geb ?ge) (gead ?ga) (req_cal_dia ?rcd))
	=>
	(retract ?fase)
	(switch ?o
		(case mantener then (modify ?pers (req_cal_dia (+ ?ge ?ga))))
		(case reducir  then (modify ?pers (req_cal_dia (* (+ ?ge ?ga) 0.9))))
	)
	(assert (calcula_lunes))
	(printout t crlf "Calculando las calorias diarias necesarias..." crlf)
)

; Reglas que inician el calculo de la dieta diaria. Imprimen la cabecera del dia de la semana en que se encuentra el sistema y ordenan empezar el calculo
; de las diferentes comidas del dia, empezando por el desayuno.

(defrule calcula_lunes
	(dia (dia_semana lunes))
	?fase <- (calcula_lunes)	
	=>
	(retract ?fase)
	(printout t crlf "******************************************************************" crlf crlf
					 "                      LUNES				 " crlf crlf) 
	(assert (fase_genera_desayuno))
)
	
(defrule calcula_martes
	(dia (dia_semana martes))
	=>
	(printout t crlf  "******************************************************************" crlf crlf
	                  "                      MARTES				 " crlf crlf) 
	                 
	(assert (fase_genera_desayuno))
)

(defrule calcula_miercoles
	(dia (dia_semana miercoles))
	=>
	(printout t crlf "******************************************************************" crlf crlf
	                 "                      MIERCOLES				 " crlf crlf) 
	(assert (fase_genera_desayuno))
)

(defrule calcula_jueves
	(dia (dia_semana jueves))		
	=>	
	(printout t crlf "******************************************************************" crlf crlf
	                 "                      JUEVES				 " crlf crlf) 
	(assert (fase_genera_desayuno))
)

(defrule calcula_viernes
	(dia (dia_semana viernes))		
	=>
	(printout t crlf "******************************************************************" crlf crlf
	                 "                      VIERNES				 " crlf crlf) 
	(assert (fase_genera_desayuno))
)

; Regla que va a generar el desayuno. Obligatorio un alimento del grupo 1 y otro del grupo 6.
; El aporte calorico del desayuno tiene que estar entre el 15 y el 25 por ciento del requerimiento calorico diario.

(defrule dieta_desayuno
	
	?fase <- (fase_genera_desayuno)
	?pers <- (persona (req_cal_dia ?rcd)(tot_calorias ?cal_tot) (tot_hidratos ?hid_tot) (tot_proteinas ?prot_tot)(tot_grasas ?gras_tot)
			 (calorias_dia ?cal_dia)(proteinas_dia ?prot_dia)(hidratos_dia ?hid_dia)(grasas_dia ?gras_dia))
	
	?d1 <- (alimento (nombre ?nombred1) (grupo 1)(calorias ?caloriasd1) (racion ?racd1)(grasas ?grasasd1) (hidratos ?hidratosd1) (proteinas ?proteinasd1)(usado no))
	?d2 <- (alimento (nombre ?nombred2) (grupo 6)(calorias ?caloriasd2) (racion ?racd2)(grasas ?grasasd2) (hidratos ?hidratosd2) (proteinas ?proteinasd2)(usado no))
	
	(test (>= (/(+ ?caloriasd1 ?caloriasd2)?rcd) 0.15))						;Minimo de calorias en el desayuno.
	(test (<= (/(+ ?caloriasd1 ?caloriasd2)?rcd) 0.25))						;Maximo de calorias en el desayuno.
	
	=>
	
	(retract ?fase)
	(retract ?d1 ?d2)
	(modify ?d1 (usado si))
	(modify ?d2 (usado si))
	
	(printout t "Calorias necesarias: " ?rcd crlf crlf)
	(printout t " ** Desayuno" crlf
	"============" crlf crlf
	"- "?racd1" gramos de " ?nombred1 ", con un total de: " ?caloriasd1 " calorias" crlf
	"- "?racd2" gramos de " ?nombred2 ", con un total de: " ?caloriasd2 " calorias" crlf crlf
	"Calorias Desayuno: "(+ ?caloriasd1 ?caloriasd2) crlf crlf)
	(modify ?pers (calorias_dia (+ 0 ?caloriasd1 ?caloriasd2))
				    (hidratos_dia (+ 0 ?hidratosd1 ?hidratosd2))
				    (proteinas_dia (+ 0 ?proteinasd1 ?proteinasd2))
				    (grasas_dia (+ 0 ?grasasd1 ?grasasd2)))
					
	(assert (fase_genera_almuerzo))				
)

; Regla que va a generar el almuerzo. Obligatorio un alimento del grupo 3 y otro del grupo 5.
; El aporte calorico del desayuno tiene que estar entre el 5 y el 15 por ciento del requerimiento calorico diario.

(defrule dieta_almuerzo
	
	?fase <- (fase_genera_almuerzo)
	?pers <- (persona (req_cal_dia ?rcd)(tot_calorias ?cal_tot) (tot_hidratos ?hid_tot) (tot_proteinas ?prot_tot)(tot_grasas ?gras_tot)
			 (calorias_dia ?cal_dia)(proteinas_dia ?prot_dia)(hidratos_dia ?hid_dia)(grasas_dia ?gras_dia))
	
	?a1 <- (alimento (nombre ?nombrea1) (grupo 3)(calorias ?caloriasa1) (racion ?raca1)(grasas ?grasasa1) (hidratos ?hidratosa1) (proteinas ?proteinasa1)(usado no))
	?a2 <- (alimento (nombre ?nombrea2) (grupo 5)(calorias ?caloriasa2) (racion ?raca2)(grasas ?grasasa2) (hidratos ?hidratosa2) (proteinas ?proteinasa2)(usado no))
	
	(test (>= (/(+ ?caloriasa1 ?caloriasa2)?rcd) 0.05))						;Minimo de calorias en el almuerzo.
	(test (<= (/(+ ?caloriasa1 ?caloriasa2)?rcd) 0.15))						;Maximo de calorias en el almuerzo.
	
	=>
	
	(retract ?fase)
	(modify ?a1 (usado si))
	(modify ?a2 (usado si))
	
	(modify ?pers (calorias_dia (+ ?cal_dia ?caloriasa1 ?caloriasa2))
				    (hidratos_dia (+ ?hid_dia ?hidratosa1 ?hidratosa2))
				    (proteinas_dia (+ ?prot_dia ?proteinasa1 ?proteinasa2))
				    (grasas_dia (+ ?gras_dia ?grasasa1 ?grasasa2)))
	
	(printout t " ** Almuerzo" crlf
	"============" crlf crlf
	"- "?raca1" gramos de " ?nombrea1 ", con un total de: " ?caloriasa1 " calorias" crlf
	"- "?raca2" gramos de " ?nombrea2 ", con un total de: " ?caloriasa2 " calorias" crlf crlf
	"Calorias Almuerzo: "(+ ?caloriasa1 ?caloriasa2) crlf crlf)
	
	(assert (fase_genera_comida))					
)

; Regla que va a generar el almuerzo. Esta debe ser la mas importante. Obligatorio un alimento del grupo 2, otro del 3, otro del 4 y otro del 7.
; El aporte calorico de la comida tiene que estar entre el 30 y el 40 por ciento del requerimiento calorico diario.
; Se intenta regular el consumo de hidratos de carbono y de grasas.

(defrule dieta_comida
	
	?fase <- (fase_genera_comida)
	?pers <- (persona (req_cal_dia ?rcd)(tot_calorias ?cal_tot) (tot_hidratos ?hid_tot) (tot_proteinas ?prot_tot)(tot_grasas ?gras_tot)
			 (calorias_dia ?cal_dia)(proteinas_dia ?prot_dia)(hidratos_dia ?hid_dia)(grasas_dia ?gras_dia))
	
	?c1 <- (alimento (nombre ?nombrec1) (grupo 4)(calorias ?caloriasc1) (racion ?racc1)(grasas ?grasasc1) (hidratos ?hidratosc1) (proteinas ?proteinasc1)(usado no))
	?c2 <- (alimento (nombre ?nombrec2) (grupo 2)(calorias ?caloriasc2) (racion ?racc2)(grasas ?grasasc2) (hidratos ?hidratosc2) (proteinas ?proteinasc2)(usado no))
	?c3 <- (alimento (nombre ?nombrec3) (grupo 3)(calorias ?caloriasc3) (racion ?racc3)(grasas ?grasasc3) (hidratos ?hidratosc3) (proteinas ?proteinasc3)(usado no))
	?c4 <- (alimento (nombre ?nombrec4) (grupo 7)(calorias ?caloriasc4) (racion ?racc4)(grasas ?grasasc4) (hidratos ?hidratosc4) (proteinas ?proteinasc4)(usado no))
	
	(test (>= (/(+ ?caloriasc1 ?caloriasc2 ?caloriasc3 ?caloriasc4)?rcd) 0.30))					;Minimo 30 por ciento de las calorias totales requeridas
	(test (<= (/(+ ?caloriasc1 ?caloriasc2 ?caloriasc3 ?caloriasc4)?rcd) 0.40))					;Maximo 40  "    "     "   "   "        "         " 
	
	(test (<= (/(*(+ ?proteinasc1 ?proteinasc2 ?proteinasc3 ?proteinasc4)4)(* ?rcd 0.35)) 0.20)) ;Limite superior de proteinas en la comida.
	
	(test (<= (/(*(+ ?hidratosc1 ?hidratosc2 ?hidratosc3 ?hidratosc4)4)(* ?rcd 0.35)) 0.60))	;Maximo nivel de hidratos en la comida.
	(test (>= (/(*(+ ?hidratosc1 ?hidratosc2 ?hidratosc3 ?hidratosc4)4)(* ?rcd 0.35)) 0.35))	;Minimo de hidratos.
	
	=>
	
	(retract ?fase)
	(modify ?c1 (usado si))
	(modify ?c2 (usado si))
	(modify ?c3 (usado si))
	(modify ?c4 (usado si))
	
	(modify ?pers (calorias_dia (+ ?cal_dia ?caloriasc1 ?caloriasc2 ?caloriasc3 ?caloriasc4))
				    (hidratos_dia (+ ?hid_dia ?hidratosc1 ?hidratosc2 ?hidratosc3 ?hidratosc4))
				    (proteinas_dia (+ ?prot_dia ?proteinasc1 ?proteinasc2 ?proteinasc3 ?proteinasc4))
				    (grasas_dia (+ ?gras_dia ?grasasc1 ?grasasc2 ?grasasc3 ?grasasc4)))
	
	(printout t " ** Comida" crlf
	"============" crlf crlf
	"- "?racc1" gramos de " ?nombrec1 ", con un total de: " ?caloriasc1 " calorias" crlf
	"- "?racc2" gramos de " ?nombrec2 ", con un total de: " ?caloriasc2 " calorias" crlf
	"- "?racc3" gramos de " ?nombrec3 ", con un total de: " ?caloriasc3 " calorias" crlf
	"- "?racc4" gramos de " ?nombrec4 ", con un total de: " ?caloriasc4 " calorias" crlf crlf
	"Calorias Comida: "(+ ?caloriasc1 ?caloriasc2 ?caloriasc3 ?caloriasc4) crlf crlf)
	
	(assert (fase_genera_merienda))	
)

; Regla que va a generar la merienda. Obligatorio un alimento del grupo 1 y otro del grupo 5.
; El aporte calorico del desayuno tiene que estar entre el 5 y el 15 por ciento del requerimiento calorico diario.

(defrule dieta_merienda
	 
	?fase <- (fase_genera_merienda)
	?pers <- (persona (req_cal_dia ?rcd)(tot_calorias ?cal_tot) (tot_hidratos ?hid_tot) (tot_proteinas ?prot_tot)(tot_grasas ?gras_tot)
			 (calorias_dia ?cal_dia)(proteinas_dia ?prot_dia)(hidratos_dia ?hid_dia)(grasas_dia ?gras_dia))
	
	?m1 <- (alimento (nombre ?nombrem1) (grupo 1)(calorias ?caloriasm1) (racion ?racm1)(grasas ?grasasm1) (hidratos ?hidratosm1) (proteinas ?proteinasm1)(usado no))
	?m2 <- (alimento (nombre ?nombrem2) (grupo 5)(calorias ?caloriasm2) (racion ?racm2)(grasas ?grasasm2) (hidratos ?hidratosm2) (proteinas ?proteinasm2)(usado no))
	
	(test (>= (/(+ ?caloriasm1 ?caloriasm2)?rcd) 0.05))							;Minimo de calorias en la merienda.
	(test (<= (/(+ ?caloriasm1 ?caloriasm2)?rcd) 0.15))							;Maximo de calorias en la merienda.
	
	=>
	
	(retract ?fase)
	(modify ?m1 (usado si))
	(modify ?m2 (usado si))
	
	(modify ?pers (calorias_dia (+ ?cal_dia ?caloriasm1 ?caloriasm2))
				    (hidratos_dia (+ ?hid_dia ?hidratosm1 ?hidratosm2))
				    (proteinas_dia (+ ?prot_dia ?proteinasm1 ?proteinasm2))
				    (grasas_dia (+ ?gras_dia ?grasasm1 ?grasasm2)))
	
	(printout t " ** Merienda" crlf
	"============" crlf crlf
	"- "?racm1" gramos de " ?nombrem1 ", con un total de: " ?caloriasm1 " calorias" crlf
	"- "?racm2" gramos de " ?nombrem2 ", con un total de: " ?caloriasm2 " calorias" crlf crlf
	"Calorias Merienda: "(+ ?caloriasm1 ?caloriasm2) crlf crlf)
	
	(assert (fase_genera_cena))				
)

; Regla que va a generar la cena. Obligatorio un alimento del grupo 2, otro del 4 y otro del 6.
; El aporte calorico del desayuno tiene que estar entre el 20 y el 30 por ciento del requerimiento calorico diario.

(defrule dieta_cena
	
	?fase <- (fase_genera_cena)
	?pers <- (persona (req_cal_dia ?rcd)(tot_calorias ?cal_tot) (tot_hidratos ?hid_tot) (tot_proteinas ?prot_tot)(tot_grasas ?gras_tot)
			 (calorias_dia ?cal_dia)(proteinas_dia ?prot_dia)(hidratos_dia ?hid_dia)(grasas_dia ?gras_dia))
	
	?ce1 <- (alimento (nombre ?nombrece1) (grupo 4)(calorias ?caloriasce1) (racion ?racce1)(grasas ?grasasce1) (hidratos ?hidratosce1) (proteinas ?proteinasce1)(usado no))
	?ce2 <- (alimento (nombre ?nombrece2) (grupo 2)(calorias ?caloriasce2) (racion ?racce2)(grasas ?grasasce2) (hidratos ?hidratosce2) (proteinas ?proteinasce2)(usado no))
	?ce3 <- (alimento (nombre ?nombrece3) (grupo 6)(calorias ?caloriasce3) (racion ?racce3)(grasas ?grasasce3) (hidratos ?hidratosce3) (proteinas ?proteinasce3)(usado no))
	
	(test (>= (/(+ ?caloriasce1 ?caloriasce2 ?caloriasce3)?rcd) 0.20))						;Minimo de calorias en la cena
	(test (<= (/(+ ?caloriasce1 ?caloriasce2 ?caloriasce3)?rcd) 0.30))						;Maximo de calorias en la cena
	
	(test (<= (/(*(+ ?hidratosce1 ?hidratosce2 ?hidratosce3)4)(* ?rcd 0.2)) 0.65))			;Control de hidratos en la cena
	(test (>= (/(*(+ ?hidratosce1 ?hidratosce2 ?hidratosce3)4)(* ?rcd 0.2)) 0.5))
	
	=>
	
	(retract ?fase)
	(modify ?ce1 (usado si))
	(modify ?ce2 (usado si))
	(modify ?ce3 (usado si))
	
	(modify ?pers (calorias_dia (+ ?cal_dia ?caloriasce1 ?caloriasce2 ?caloriasce3))
				    (hidratos_dia (+ ?hid_dia ?hidratosce1 ?hidratosce2 ?hidratosce3))
				    (proteinas_dia (+ ?prot_dia ?proteinasce1 ?proteinasce2 ?proteinasce3))
				    (grasas_dia (+ ?gras_dia ?grasasce1 ?grasasce2 ?grasasce3)))
	
	(printout t " ** Cena" crlf
	"============" crlf crlf
	"- "?racce1" gramos de " ?nombrece1 ", con un total de: " ?caloriasce1 " calorias" crlf 
	"- "?racce2" gramos de " ?nombrece2 ", con un total de: " ?caloriasce2 " calorias" crlf
	"- "?racce3" gramos de " ?nombrece3 ", con un total de: " ?caloriasce3 " calorias" crlf crlf
	"Calorias Cena: "(+ ?caloriasce1 ?caloriasce2 ?caloriasce3) crlf crlf)
	
	(assert (fase_imprime_dia))				
)

; A continuacion se definen reglas para imprimir los resultados diarios.
; LUNES.

(defrule imprime-lunes
	
	?d <- (dia (dia_semana lunes))
	?fase <- (fase_imprime_dia)
	?pers <- (persona(req_cal_dia ?rcd) (tot_calorias ?cal_tot) (tot_hidratos ?hid_tot) 
				(tot_grasas ?gras_tot) (tot_proteinas ?prot_tot) (calorias_dia ?cal_dia) 
				(proteinas_dia ?prot_dia) (grasas_dia ?gras_dia) (hidratos_dia ?hid_dia))
	=>

	(retract ?fase)
	     (modify ?pers (tot_calorias 	(+ ?cal_tot 	?cal_dia)) 
						  (tot_hidratos 	(+ ?hid_tot 	?hid_dia))
						  (tot_proteinas	(+ ?prot_tot 	?prot_dia))
						  (tot_grasas 		(+ ?gras_tot 	?gras_dia)))
		 
		(printout t "           DATOS LUNES         " crlf
		            "          -------------        " crlf)
		(printout	t crlf " % proteinas:  " (/(*(* ?prot_dia 4) 100) ?cal_dia)"      " ?prot_dia " gramos")
		(printout	t crlf " % hidratos:   " (/(*(* ?hid_dia 4) 100) ?cal_dia) "      " ?hid_dia  " gramos")
		(printout	t crlf " % grasas:     " (/(*(* ?gras_dia 9) 100) ?cal_dia)"      " ?gras_dia " gramos")
		(printout	t crlf " - calorias teoricas:   "?rcd)
		(printout	t crlf " - calorias consumidas: " ?cal_dia)
		(printout	t crlf " - deficit calorico:    " (abs(- ?cal_dia ?rcd)) crlf)
	
	(modify ?d (dia_semana martes))
)	

; MARTES.

(defrule imprime-martes
	
	?d <- (dia (dia_semana martes))
	?fase <- (fase_imprime_dia)
	?pers <- (persona(req_cal_dia ?rcd) (tot_calorias ?cal_tot) (tot_hidratos ?hid_tot) 
				(tot_grasas ?gras_tot) (tot_proteinas ?prot_tot) (calorias_dia ?cal_dia) 
				(proteinas_dia ?prot_dia) (grasas_dia ?gras_dia) (hidratos_dia ?hid_dia))
	=>

	(retract ?fase)
	     (modify ?pers (tot_calorias 	(+ ?cal_tot 	?cal_dia)) 
						  (tot_hidratos 	(+ ?hid_tot 	?hid_dia))
						  (tot_proteinas	(+ ?prot_tot 	?prot_dia))
						  (tot_grasas 		(+ ?gras_tot 	?gras_dia)))
		
		(printout t "           DATOS MARTES         " crlf
		            "          --------------        " crlf)
		(printout	t crlf " % proteinas:  " (/(*(* ?prot_dia 4) 100) ?cal_dia)"      " ?prot_dia " gramos")
		(printout	t crlf " % hidratos:   " (/(*(* ?hid_dia 4) 100) ?cal_dia) "      " ?hid_dia  " gramos")
		(printout	t crlf " % grasas:     " (/(*(* ?gras_dia 9) 100) ?cal_dia)"      " ?gras_dia " gramos")
		(printout	t crlf " - calorias teoricas:   "?rcd)
		(printout	t crlf " - calorias consumidas: " ?cal_dia)
		(printout	t crlf " - deficit calorico:    " (abs(- ?cal_dia ?rcd)) crlf)
	
	(modify ?d (dia_semana miercoles))
)	

; MIERCOLES.

(defrule imprime-miercoles
	
	?d <- (dia (dia_semana miercoles))
	?fase <- (fase_imprime_dia)
	?pers <- (persona(req_cal_dia ?rcd) (tot_calorias ?cal_tot) (tot_hidratos ?hid_tot) 
				(tot_grasas ?gras_tot) (tot_proteinas ?prot_tot) (calorias_dia ?cal_dia) 
				(proteinas_dia ?prot_dia) (grasas_dia ?gras_dia) (hidratos_dia ?hid_dia))
	=>

	(retract ?fase)
	     (modify ?pers (tot_calorias 	(+ ?cal_tot 	?cal_dia)) 
						  (tot_hidratos 	(+ ?hid_tot 	?hid_dia))
						  (tot_proteinas	(+ ?prot_tot 	?prot_dia))
						  (tot_grasas 		(+ ?gras_tot 	?gras_dia)))
		 
		(printout t "           DATOS MIERCOLES         " crlf
		            "          -----------------        " crlf)
		(printout	t crlf " % proteinas:  " (/(*(* ?prot_dia 4) 100) ?cal_dia)"      " ?prot_dia " gramos")
		(printout	t crlf " % hidratos:   " (/(*(* ?hid_dia 4) 100) ?cal_dia) "      " ?hid_dia  " gramos")
		(printout	t crlf " % grasas:     " (/(*(* ?gras_dia 9) 100) ?cal_dia)"      " ?gras_dia " gramos")
		(printout	t crlf " - calorias teoricas:   "?rcd)
		(printout	t crlf " - calorias consumidas: " ?cal_dia)
		(printout	t crlf " - deficit calorico:    " (abs(- ?cal_dia ?rcd)) crlf)
	
	(modify ?d (dia_semana jueves))
)	

; JUEVES.

(defrule imprime-jueves
	
	?d <- (dia (dia_semana jueves))
	?fase <- (fase_imprime_dia)
	?pers <- (persona(req_cal_dia ?rcd) (tot_calorias ?cal_tot) (tot_hidratos ?hid_tot) 
				(tot_grasas ?gras_tot) (tot_proteinas ?prot_tot) (calorias_dia ?cal_dia) 
				(proteinas_dia ?prot_dia) (grasas_dia ?gras_dia) (hidratos_dia ?hid_dia))
	=>

	(retract ?fase)
	     (modify ?pers (tot_calorias 	(+ ?cal_tot 	?cal_dia)) 
						  (tot_hidratos 	(+ ?hid_tot 	?hid_dia))
						  (tot_proteinas	(+ ?prot_tot 	?prot_dia))
						  (tot_grasas 		(+ ?gras_tot 	?gras_dia)))
		 
		 (printout t "           DATOS JUEVES         " crlf
		             "          --------------        " crlf)
		(printout	t crlf " % proteinas:  " (/(*(* ?prot_dia 4) 100) ?cal_dia)"      " ?prot_dia " gramos")
		(printout	t crlf " % hidratos:   " (/(*(* ?hid_dia 4) 100) ?cal_dia) "      " ?hid_dia  " gramos")
		(printout	t crlf " % grasas:     " (/(*(* ?gras_dia 9) 100) ?cal_dia)"      " ?gras_dia " gramos")
		(printout	t crlf " - calorias teoricas:   "?rcd)
		(printout	t crlf " - calorias consumidas: " ?cal_dia)
		(printout	t crlf " - deficit calorico:    " (abs(- ?cal_dia ?rcd)) crlf)
	
	(modify ?d (dia_semana viernes))
)	

; VIERNES.

(defrule imprime-viernes
	
	?d <- (dia (dia_semana viernes))
	?fase <- (fase_imprime_dia)
	?pers <- (persona(req_cal_dia ?rcd) (tot_calorias ?cal_tot) (tot_hidratos ?hid_tot) 
				(tot_grasas ?gras_tot) (tot_proteinas ?prot_tot) (calorias_dia ?cal_dia) 
				(proteinas_dia ?prot_dia) (grasas_dia ?gras_dia) (hidratos_dia ?hid_dia))
	=>

	(retract ?fase)
	     (modify ?pers (tot_calorias 	(+ ?cal_tot 	?cal_dia)) 
						  (tot_hidratos 	(+ ?hid_tot 	?hid_dia))
						  (tot_proteinas	(+ ?prot_tot 	?prot_dia))
						  (tot_grasas 		(+ ?gras_tot 	?gras_dia)))
		 
		 (printout t "           DATOS VIERNES         " crlf
		             "          ---------------        " crlf)
		(printout	t crlf " % proteinas:  " (/(*(* ?prot_dia 4) 100) ?cal_dia)"      " ?prot_dia " gramos")
		(printout	t crlf " % hidratos:   " (/(*(* ?hid_dia 4) 100) ?cal_dia) "      " ?hid_dia  " gramos")
		(printout	t crlf " % grasas:     " (/(*(* ?gras_dia 9) 100) ?cal_dia)"      " ?gras_dia " gramos")
		(printout	t crlf " - calorias teoricas:   "?rcd)
		(printout	t crlf " - calorias consumidas: " ?cal_dia)
		(printout	t crlf " - deficit calorico:    " (abs(- ?cal_dia ?rcd)) crlf)
	
	(assert (fase_datos_totales))	
)

; Regla que imprime el total de los datos semanales, con lo que acaba la ejecucion del programa.	

(defrule imprime_datos_semanales
	
	?fase <- (fase_datos_totales)
	?pers <- (persona (nombre $?nom)(apellidos $?ap)(edad ?ed)(sexo ?sex)
				(peso ?pes) (actividad ?act) (objetivo ?obj)
				(req_cal_dia ?rcd) (tot_grasas ?gras_tot)(tot_hidratos ?hid_tot)
				(tot_proteinas ?prot_tot)(tot_calorias ?cal_tot))
	
	=>
	
	(retract ?fase)
		(printout t crlf "******************************************************************" crlf crlf
		"           DATOS SEMANALES        " crlf
		"          -----------------       " crlf crlf)
		
		(printout t "* Nombre: " ?nom crlf)
		(printout t "* Apellidos: " ?ap crlf)
		(printout t "* Edad: " ?ed crlf)
		(printout t "* Sexo: " ?sex crlf)
		(printout t "* Peso: " ?pes crlf)
		(printout t "* Actividad: " ?act crlf)
		(printout t "* Objetivo: " ?obj crlf crlf)

		(printout   t crlf " % proteinas: " (/(*(* ?prot_tot 4) 100) ?cal_tot))
		(printout	t crlf " % hidratos:  " (/(*(* ?hid_tot 4) 100) ?cal_tot))
		(printout	t crlf " % grasas:    " (/(*(* ?gras_tot 9) 100) ?cal_tot))
		(printout	t crlf " - calorias teoricas:   "(* ?rcd 5))
		(printout	t crlf " - calorias consumidas: " ?cal_tot)
		(printout	t crlf " - deficit calorico:    " (abs(- ?cal_tot (* ?rcd 5))) crlf)	
		(printout t crlf "******************************************************************" crlf crlf)
)	

	
