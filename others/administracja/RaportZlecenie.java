package administracja;

import java.util.Date;

public class RaportZlecenie {
	private Date poczatek;
	private Date koniec;
	
	public RaportZlecenie(Date poczatek, Date koniec) {
		this.poczatek = poczatek;
		this.koniec = koniec;
	}

	public Date getKoniec() {
		return koniec;
	}
	
	public Date getPoczatek() {
		return poczatek;
	}
	public String getRaport(){
		return "Tutaj powinno si� znajdowa� cokolwiek o raporcie. To jest klasa bazowa, wi�c tu nic (note really, maybe, it's classified)";
		
	}
}
