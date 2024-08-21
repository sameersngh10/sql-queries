use ng_practice;

CREATE TABLE vendor (
    id INT PRIMARY KEY auto_increment,
    email VARCHAR(255) NOT NULL,
    brandName VARCHAR(255),
    contact_name VARCHAR(255),
    mobile VARCHAR(20),
    onboarding_status VARCHAR(50),
    websiteUrl VARCHAR(255),
    facebook VARCHAR(255),
    instagram VARCHAR(255),
    twitter VARCHAR(255),
    isactivee BOOLEAN DEFAULT TRUE
);

CREATE TABLE brandReview (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vendorId VARCHAR(255),
    brandDescription TEXT,
    certifications JSON, 
    companyAddress TEXT,
    companyLogo VARCHAR(255),
    companyName VARCHAR(255),
    materialDetails TEXT,
    packageFree BOOLEAN,
    packagingMaterial TEXT,
    productManufactured TEXT,
    shippingCity VARCHAR(255),
    shippingState VARCHAR(255),
    supportCause JSON, 
    FOREIGN KEY (vendorId) REFERENCES vendor(id)
);

CREATE TABLE reviewOverallBrand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vendorId VARCHAR(255),
    contact_name VARCHAR(255),
    companyName VARCHAR(255),
    completeAddress TEXT,
    pincode VARCHAR(10),
    email VARCHAR(255),
    mobile VARCHAR(20),
    weight DECIMAL(10, 2),  
    dimension VARCHAR(255), 
    sampleType VARCHAR(255),
    sampleFeedback TEXT,  
    commercialSuggested TEXT,  
    sampleImage VARCHAR(255),  
    zeroMarginPerOrder DECIMAL(10, 2),  
    shippingCostPerOrder DECIMAL(10, 2),  
    platformFeePerOrder DECIMAL(10, 2),  
    marketingCost DECIMAL(10, 2), 
    FOREIGN KEY (vendorId) REFERENCES vendor(id)
);

CREATE TABLE commercialAgreement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vendorId VARCHAR(255),
    email VARCHAR(255),
    brandName VARCHAR(255),
    brandDescription TEXT,
    communicationAddress TEXT,
    RegisteredName VARCHAR(255),
    companyType VARCHAR(255),
    billingAddress TEXT,
    shippingAddress TEXT,
    campaignImages VARCHAR(255), 
    authorisedSignatoryName VARCHAR(255),
    authorisedSignatoryDesignation VARCHAR(255),
    authorisedSignatoryMobileNumber VARCHAR(20),
    authorisedSignatoryEmail VARCHAR(255),
    backendManagerName VARCHAR(255),
    backendManagerMobileNumber VARCHAR(20),
    backendManagerEmail VARCHAR(255),
    finanaceManagerName VARCHAR(255),
    finanaceManagerMobileNumber VARCHAR(20),
    financeManagerEmail VARCHAR(255),
    productManagerName VARCHAR(255),
    productManagerMobileNumber VARCHAR(20),
    productManagerEmail VARCHAR(255),
    bankAccountName VARCHAR(255),
    bankName VARCHAR(255),
    branchName VARCHAR(255),
    bankIFSCcode VARCHAR(20),
    bankAccountNumber VARCHAR(20),
    bankAccountType VARCHAR(50),
    accCancelledChequeImage VARCHAR(255),  
    comapnyRegistrationNumber VARCHAR(50),
    PANnumber VARCHAR(10),
    GSTNumber VARCHAR(15),
    GSTFillingFrequency VARCHAR(50),
    marginFeePercentage DECIMAL(5, 2),
    countryOfOrigin VARCHAR(100),
    operationRegion VARCHAR(255),
    materialSource TEXT,
    bulkQuantities TEXT,
    brandStory TEXT,
    missionStatement TEXT,
    impactCreated TEXT,
    overallEmployment INT,
    fullTimeEmp INT,
    partTimeEmp INT,
    womenEmp INT,
    fairwage BOOLEAN,
    artisianEmpowered BOOLEAN,
    impactScale TEXT,
    artisianProfile TEXT,
    impactDepth TEXT,
    skillDev TEXT,
    otherImpact TEXT,
    FOREIGN KEY (vendorId) REFERENCES vendor(id)
);

INSERT INTO vendor (
    vendorId, email, brandName, contact_name, mobile, onboarding_status, websiteUrl, 
    facebook, instagram, twitter, isactivee
) 
VALUES (
    '1234', 'vendor@example.com', 'Awesome Brand', 'John Doe', '1234567890', 
    'Completed', 'https://awesomebrand.com', 'https://facebook.com/awesomebrand', 
    'https://instagram.com/awesomebrand', 'https://twitter.com/awesomebrand', TRUE
);

INSERT INTO brandReview (
     brandDescription, certifications, companyAddress, companyLogo, 
    companyName, materialDetails, packageFree, packagingMaterial, 
    productManufactured, shippingCity, shippingState, supportCause
) 
VALUES (
     
    'A leading brand known for its eco-friendly products.', 
    JSON_ARRAY('ISO 9001', 'EcoCert'),  
    '123 Green Street, EcoCity, EC1001', 
    'https://example.com/logo.png', 
    'EcoBrand', 
    'Organic cotton, recycled materials', 
    TRUE, 
    'Recyclable packaging', 
    'Clothing and accessories', 
    'EcoCity', 
    'GreenState', 
    JSON_ARRAY('Environmental sustainability', 'Fair trade')  
);





select * from vendor;
select * from brandReview;