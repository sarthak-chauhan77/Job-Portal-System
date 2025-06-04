package servlets;

import com.google.protobuf.Timestamp;

public class jobClass {
    private int id;
    private String title;
    private String company;
    private String qualification;
    private String location;
    private String type;
    private String category;
    private Timestamp postedTime;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getCompany() { return company; }
    public void setCompany(String company) { this.company = company; }

    public String getqualification() { return qualification; }
    public void setqualification(String qualification) { this.qualification = qualification; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public Timestamp getPostedTime() { return postedTime; }
    public void setPostedTime(Timestamp postedTime) { this.postedTime = postedTime; }
}
