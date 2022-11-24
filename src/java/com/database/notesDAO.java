package com.database;

import com.User.userNotes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

public class notesDAO {

    public Connection con;

    public notesDAO(Connection con) {
        this.con = con;
    }

    public boolean addnotes(userNotes un) {
        boolean f = false;
        try {
            String query = "INSERT INTO notes (title,contents,uid) VALUES(?,?,?)";       //id,title,contents,date,uid

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, un.getTitle());
            ps.setString(2, un.getContents());
            ps.setInt(3, un.getUid());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<userNotes> getNotes(int id) {
        List<userNotes> list = new ArrayList<userNotes>();
        userNotes notes = null;
        try {
            String query = "SELECT * FROM notes WHERE uid = ? ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                notes = new userNotes();
                notes.setId(rs.getInt(1));
                notes.setTitle(rs.getString(2));
                notes.setContents(rs.getString(3));
                notes.setDate(rs.getTimestamp(4));
                notes.setUid(rs.getInt(5));
                list.add(notes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public userNotes get_Notes_byId(int noteId) {
        userNotes notes = null;
        try {
            String query = "SELECT * FROM notes WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, noteId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                notes = new userNotes();//title,contents,uid
                notes.setId(rs.getInt(1));
                notes.setTitle(rs.getString(2));
                notes.setContents(rs.getString(3));
                notes.setUid(rs.getInt(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return notes;
    }

    public boolean editnotes(userNotes un) {
        boolean f = false;
        try {
            String query = "UPDATE notes SET title=?,contents=?,date=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, un.getTitle());
            ps.setString(2, un.getContents());
//            ps.setTimestamp(3, new java.sql.Timestamp(System.currentTimeMillis()));
            ps.setTimestamp(3, java.sql.Timestamp.valueOf(java.time.LocalDateTime.now()));
            ps.setInt(4, un.getId());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public boolean deletenotes(int id) {
        boolean f = false;
        try {
            String query = "DELETE FROM notes WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
