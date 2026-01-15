Cosas que me gustaría poner:
	- Centrar las pegatinas en los huecos -> ahora no va porque se coloca a partir de la esquina de la pegatina
	sin tener en cuenta el tamaño de la pegatina. -> INTUICIÓN: alguna fórmula para calcular la posición idónea para cada
	pegatina como función interna del propio hueco.

	- Quitar pegatina de un hueco -> INTUICIÓN: que fuera de la mesa también puedas colocar la pegatina, o bien que tengas una
	papelera que solo aparece cuando estás arrastrando una pegatina (por ejemplo, arriba de la pantalla) y así que indique que 
	la puedes tirar ahí

	- Si quieres colocar otra pegatina en un hueco con una pegatina, entonces que el área de drop siga siendo la misma
	área que el hueco, ya que ahora mismo lo que pasa es que al estar ya una pegatina, si pasas el ratón por encima de esa
	pegatina para dejar la nuevo NO te deja. Y yo quiero que haga un reemplazo.
	
	- Si arrastas una pegatina y pasas el cursor por encima de otra, esta no se haga más grande (que no detecte que el mouse está
	ahí, o que esté disabled) -> Suena a algo más avanzado, con algún tipo de manager del minijuego o algo.

	- Las zonas donde se pueden poner las pegatinas solo se ven cuando estás arrastrando una pegatina -> Lo más fácil es que el
	área siempre esté visible pero no quiero que esto de la sensación de que forma parte de la postal... Tal vez es una tontería...
	
✅	- El hover de las pegatinas (que se hagan grandes cuando el mouse encima) lo que haga es que crezcan desde el centro
	SOLVED! Era muy fácil, solo una línea de código: pivot_offset = size / 2


PENDIENTE
	- Añadir la selección de qué postal decorar
		- IDEA: integrar la selección como si fuesen hojas que están a un lado? (encima de los rotus) O debajo de la postal actual?
	
	- Añadir botón de finalizar el minijuego PERO con condiciones
