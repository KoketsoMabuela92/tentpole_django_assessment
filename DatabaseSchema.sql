-- Create table for Tenants
CREATE TABLE Tenant (
    TenantID TEXT PRIMARY KEY,
    Region TEXT NOT NULL
);

-- Create table for Users
CREATE TABLE User (
    UserID TEXT PRIMARY KEY,
    TenantID TEXT NOT NULL,
    Username TEXT NOT NULL,
    PasswordHash TEXT NOT NULL,
    Email TEXT NOT NULL,
    FOREIGN KEY (TenantID) REFERENCES Tenant (TenantID)
);

-- Create table for UserRoles
CREATE TABLE UserRole (
    UserRoleID TEXT PRIMARY KEY,
    RoleName TEXT NOT NULL CHECK (RoleName IN ('Admin', 'Director', 'Manager', 'General User'))
);

-- Create table for UserTenantRole
CREATE TABLE UserTenantRole (
    UserTenantRoleID TEXT PRIMARY KEY,
    UserID TEXT NOT NULL,
    TenantID TEXT NOT NULL,
    UserRoleID TEXT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User (UserID),
    FOREIGN KEY (TenantID) REFERENCES Tenant (TenantID),
    FOREIGN KEY (UserRoleID) REFERENCES UserRole (UserRoleID)
);

-- Create table for GlobalAccess
CREATE TABLE GlobalAccess (
    GlobalAccessID TEXT PRIMARY KEY,
    TenantID TEXT NOT NULL,
    FOREIGN KEY (TenantID) REFERENCES Tenant (TenantID)
);

-- Sample Data Insertion

-- Insert regions into Tenant table
INSERT INTO Tenant (TenantID, Region) VALUES ('tenant1', 'America');
INSERT INTO Tenant (TenantID, Region) VALUES ('tenant2', 'Middle East and Africa');
INSERT INTO Tenant (TenantID, Region) VALUES ('tenant3', 'Australia');
INSERT INTO Tenant (TenantID, Region) VALUES ('tenant4', 'Asia Pacific');
INSERT INTO Tenant (TenantID, Region) VALUES ('tenant5', 'Global');

-- Insert roles into UserRole table
INSERT INTO UserRole (UserRoleID, RoleName) VALUES ('role1', 'Admin');
INSERT INTO UserRole (UserRoleID, RoleName) VALUES ('role2', 'Director');
INSERT INTO UserRole (UserRoleID, RoleName) VALUES ('role3', 'Manager');
INSERT INTO UserRole (UserRoleID, RoleName) VALUES ('role4', 'General User');

-- Insert a user and assign roles
INSERT INTO User (UserID, TenantID, Username, PasswordHash, Email) VALUES ('user1', 'tenant1', 'john_doe', 'hashed_password', 'john_doe@example.com');
INSERT INTO UserTenantRole (UserTenantRoleID, UserID, TenantID, UserRoleID) VALUES ('utr1', 'user1', 'tenant1', 'role1');

-- Assign Global Tenant access
INSERT INTO GlobalAccess (GlobalAccessID, TenantID) VALUES ('ga1', 'tenant1');
INSERT INTO GlobalAccess (GlobalAccessID, TenantID) VALUES ('ga2', 'tenant2');
INSERT INTO GlobalAccess (GlobalAccessID, TenantID) VALUES ('ga3', 'tenant3');
INSERT INTO GlobalAccess (GlobalAccessID, TenantID) VALUES ('ga4', 'tenant4');

