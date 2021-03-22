package com.bjw.board;

public class InsertBean {

	private String name;
	private int age;
	
	public InsertBean(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	public InsertBean() {
		super();
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "InsertBean [name=" + name + ", age=" + age + "]";
	}
	
	
}
