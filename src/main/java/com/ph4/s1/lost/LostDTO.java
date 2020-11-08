package com.ph4.s1.lost;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class LostDTO {
	private long num;
	private String state;
	private Date startDate;
	private Date endDate;
	private Date lostDate;
	private String lostProvince;
	private String lostCity;
	private String lostLocation;
	private String phone;
	private String animalSpecies;
	private String detailSpecies;
	private String gender;
	private String age;
	private String color;
	private String feature;
	private String contents;
	private String id;
	private String fileName;
	
	
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getLostDate() {
		return lostDate;
	}
	public void setLostDate(Date lostDate) {
		this.lostDate = lostDate;
	}
	public String getLostProvince() {
		return lostProvince;
	}
	public void setLostProvince(String lostProvince) {
		this.lostProvince = lostProvince;
	}
	public String getLostCity() {
		return lostCity;
	}
	public void setLostCity(String lostCity) {
		this.lostCity = lostCity;
	}
	public String getLostLocation() {
		return lostLocation;
	}
	public void setLostLocation(String lostLocation) {
		this.lostLocation = lostLocation;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAnimalSpecies() {
		return animalSpecies;
	}
	public void setAnimalSpecies(String animalSpecies) {
		this.animalSpecies = animalSpecies;
	}
	public String getDetailSpecies() {
		return detailSpecies;
	}
	public void setDetailSpecies(String detailSpecies) {
		this.detailSpecies = detailSpecies;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
