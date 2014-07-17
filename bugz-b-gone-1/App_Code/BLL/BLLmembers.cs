using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLmembers
/// </summary>
public class BLLmembers
{
    DALmembers DALmembers = new DALmembers();

    public void insertMember(ProductUser p_productuser)
    {
        DALmembers.insertMember(p_productuser);
    }

    public void insertUserProject(UsersOnProject p_UserProject)
    {
        DALmembers.insertUserProject(p_UserProject);
    }

}