package com.User;

import java.util.Date;

public class userNotes {

    private int id;
    private String title;
    private String contents;
    private Date date;
    private int Uid;

    public userNotes(){
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setUid(int Uid) {
        this.Uid = Uid;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContents() {
        return contents;
    }

    public Date getDate() {
        return date;
    }

    public int getUid() {
        return Uid;
    }

}
