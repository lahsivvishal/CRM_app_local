class Lead {
  String name;
  String title;
  String email;
  String phone;
  String altPhone;
  String company;
  String leadSource;
  String address1;
  String address2;
  String city;
  String state;
  String country;
  String lastContactedDate;
  String createdDate;
  String description;
  String department;
  String timeZone;

  Lead(
      this.name,
      this.title,
      this.email,
      this.phone,
      this.altPhone,
      this.company,
      this.leadSource,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.country,
      this.lastContactedDate,
      this.createdDate,
      this.description,
      this.department,
      this.timeZone);

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
        json["name"],
        json["title"],
        json["email"],
        json["phone"],
        json["altPhone"],
        json["company"],
        json["leadSource"],
        json["address1"],
        json["address2"],
        json["city"],
        json["state"],
        json["country"],
        json["lastContactedDate"],
        json["createdDate"],
        json["description"],
        json["department"],
        json["timeZone"]);
  }
}

class Contact {
  String name;
  String title;
  String email;
  String phone;
  String altPhone;
  String company;
  String address1;
  String address2;
  String city;
  String state;
  String country;
  String lastContactedDate;
  String createdDate;
  String description;
  String department;
  String timeZone;

  Contact(
      this.name,
      this.title,
      this.email,
      this.phone,
      this.altPhone,
      this.company,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.country,
      this.lastContactedDate,
      this.createdDate,
      this.description,
      this.department,
      this.timeZone);

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        json["name"],
        json["title"],
        json["email"],
        json["phone"],
        json["altPhone"],
        json["company"],
        json["address1"],
        json["address2"],
        json["city"],
        json["state"],
        json["country"],
        json["lastContactedDate"],
        json["createdDate"],
        json["description"],
        json["department"],
        json["timeZone"]);
  }
}

class Opportunity {
  String name;
  String company;
  String stage;
  String closeDate;
  String value;
  String createdDate;
  String description;

  Opportunity(this.name, this.company, this.stage, this.closeDate, this.value,
      this.createdDate, this.description);

  factory Opportunity.fromJson(Map<String, dynamic> json) {
    return Opportunity(
        json["name"],
        json["company"],
        json["stage"],
        json["closeDate"],
        json["value"],
        json["createdDate"],
        json["Description"]);
  }
}

class Company {
  String name;
  String address;
  String opportunities;
  String pipelineRevenue;
  String revenueAchieved;
  String city;
  String state;
  String country;
  String zipcode;
  String phone;
  String timezone;
  String tags;

  Company(
      this.name,
      this.address,
      this.opportunities,
      this.pipelineRevenue,
      this.revenueAchieved,
      this.city,
      this.state,
      this.country,
      this.zipcode,
      this.phone,
      this.timezone,
      this.tags);

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      json["name"],
      json["address"],
      json["opportunities"],
      json["pipelineRevenue"],
      json["revenueAchieved"],
      json["city"],
      json["state"],
      json["country"],
      json["zipcode"],
      json["phone"],
      json["timezone"],
      json["tags"],
    );
  }
}
