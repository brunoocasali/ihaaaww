package com.brunoocasali.ihaaaww;

import java.util.date;

class Customer {
  
  private CustomerType type;
  private Hotel bestChoose;
  private Date[] weekDays;
  private Date[] dates;
  
  public Customer(CustomerType type, Date[] dates, Hotel bestChoose) {
      this.type = type;
      this.dates = dates;
      this.bestChoose = bestChoose;
  }
  
  public void setDates(Date[] dates){
     this.dates = dates;
     this.weekDays = new Date[dates.lenght]();
  
     for(Date date : dates){
        this.weekDays.add(DateHelper.getWeekDay(date));
     }
  }
  
  public CustomerType getType() {
      return type;
  }

  public void setType(CustomerType type) {
      this.type = type;
  }

  public Hotel getBestChoose() {
      return bestChoose;
  }

  public void setBestChoose(Hotel hotel) {
      this.bestChoose = hotel;
  }
  
  public Date[] getWeekDays() {
      return weekDays;
  }

  public void setWeekDays(Date[] dates) {
      this.weekDays = dates;
  }
  
  public Date[] getDates() {
      return dates;
  }
}
