/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author Dell Latitude 7490
 */
public class UserGoogleDTO {
    private String id;    
    private String email;
    private boolean verifiedEmail;
    private String name;
    private String given_name;
    private String family_name;
    private String picture;

    public UserGoogleDTO() {
    }

    public UserGoogleDTO(String id, String email, boolean verifiedEmail, String name, String given_name, String family_name, String picture) {
        this.id = id;
        this.email = email;
        this.verifiedEmail = verifiedEmail;
        this.name = name;
        this.given_name = given_name;
        this.family_name = family_name;
        this.picture = picture;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isVerifiedEmail() {
        return verifiedEmail;
    }

    public void setVerifiedEmail(boolean verifiedEmail) {
        this.verifiedEmail = verifiedEmail;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGiven_name() {
        return given_name;
    }

    public void setGiven_name(String given_name) {
        this.given_name = given_name;
    }

    public String getFamily_name() {
        return family_name;
    }

    public void setFamily_name(String family_name) {
        this.family_name = family_name;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    @Override
    public String toString() {
        return "UserGoogleDTO{" + "id=" + id + ", email=" + email + ", verifiedEmail=" + verifiedEmail + ", name=" + name + ", given_name=" + given_name + ", family_name=" + family_name + ", picture=" + picture + '}';
    }
    
    
}
