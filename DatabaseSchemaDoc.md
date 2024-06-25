## Explanation of the Schema

 - Tenant Table: This table stores information about each tenant, including a unique TenantID and the Region they belong to.

- User Table: This table stores user information, including a unique UserID, the TenantID they belong to, their Username, PasswordHash, and Email.

- UserRole Table: This table defines the different roles available in the system. Each role has a unique UserRoleID and a RoleName.

- UserTenantRole Table: This table establishes the relationship between users, tenants, and roles. Each record links a UserID to a TenantID and a UserRoleID.

- GlobalAccess Table: This table tracks which tenants have global access, allowing the global tenant to access data from these tenants.
