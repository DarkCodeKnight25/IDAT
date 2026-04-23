package pe.edu.idat.examen.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "person")
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "business_entity_id")
    private Integer businessEntityId;

    @NotBlank
    @Column(name = "person_type", length = 2, nullable = false)
    private String personType;

    @Column(name = "name_style")
    private Boolean nameStyle;

    @Column(name = "title", length = 8)
    private String title;

    @NotBlank
    @Column(name = "first_name", length = 50, nullable = false)
    private String firstName;

    @Column(name = "middle_name", length = 50)
    private String middleName;

    @NotBlank
    @Column(name = "last_name", length = 50, nullable = false)
    private String lastName;

    @Column(name = "suffix", length = 10)
    private String suffix;

    @Column(name = "email_promotion")
    private Integer emailPromotion;

    @Column(name = "additional_contact_info", columnDefinition = "TEXT")
    private String additionalContactInfo;

    @Column(name = "demographics", columnDefinition = "TEXT")
    private String demographics;

    @Column(name = "rowguid", length = 36, nullable = false)
    private String rowguid;

    @Column(name = "modified_date", nullable = false)
    private LocalDateTime modifiedDate;

    public Person() {
    }

    public Integer getBusinessEntityId() {
        return businessEntityId;
    }

    public void setBusinessEntityId(Integer businessEntityId) {
        this.businessEntityId = businessEntityId;
    }

    public String getPersonType() {
        return personType;
    }

    public void setPersonType(String personType) {
        this.personType = personType;
    }

    public Boolean getNameStyle() {
        return nameStyle;
    }

    public void setNameStyle(Boolean nameStyle) {
        this.nameStyle = nameStyle;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public Integer getEmailPromotion() {
        return emailPromotion;
    }

    public void setEmailPromotion(Integer emailPromotion) {
        this.emailPromotion = emailPromotion;
    }

    public String getAdditionalContactInfo() {
        return additionalContactInfo;
    }

    public void setAdditionalContactInfo(String additionalContactInfo) {
        this.additionalContactInfo = additionalContactInfo;
    }

    public String getDemographics() {
        return demographics;
    }

    public void setDemographics(String demographics) {
        this.demographics = demographics;
    }

    public String getRowguid() {
        return rowguid;
    }

    public void setRowguid(String rowguid) {
        this.rowguid = rowguid;
    }

    public LocalDateTime getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(LocalDateTime modifiedDate) {
        this.modifiedDate = modifiedDate;
    }
}