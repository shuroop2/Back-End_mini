package com.cooltimetrip.project.model;

public class FlightVO {
	private String vihicleId;
	private String airlineNm;
	private long depPlandTime;
	private long arrPlandTime;
	private long economyCharge;
	private long prestigeCharge;
	private String depAirportNm;
	private String arrAirportNm;
	
	public String getVihicleId() {
		return vihicleId;
	}
	public void setVihicleId(String vihicleId) {
		this.vihicleId = vihicleId;
	}
	public String getAirlineNm() {
		return airlineNm;
	}
	public void setAirlineNm(String airlineNm) {
		this.airlineNm = airlineNm;
	}
	public long getDepPlandTime() {
		return depPlandTime;
	}
	public void setDepPlandTime(long depPlandTime) {
		this.depPlandTime = depPlandTime;
	}
	public long getArrPlandTime() {
		return arrPlandTime;
	}
	public void setArrPlandTime(long arrPlandTime) {
		this.arrPlandTime = arrPlandTime;
	}
	public long getEconomyCharge() {
		return economyCharge;
	}
	public void setEconomyCharge(long economyCharge) {
		this.economyCharge = economyCharge;
	}
	public long getPrestigeCharge() {
		return prestigeCharge;
	}
	public void setPrestigeCharge(long prestigeCharge) {
		this.prestigeCharge = prestigeCharge;
	}
	public String getDepAirportNm() {
		return depAirportNm;
	}
	public void setDepAirportNm(String depAirportNm) {
		this.depAirportNm = depAirportNm;
	}
	public String getArrAirportNm() {
		return arrAirportNm;
	}
	public void setArrAirportNm(String arrAirportNm) {
		this.arrAirportNm = arrAirportNm;
	}
}
