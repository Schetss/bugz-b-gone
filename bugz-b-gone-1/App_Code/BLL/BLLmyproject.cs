using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLmyproject
/// </summary>
public class BLLmyproject
{

    DALmyproject DALmyproject = new DALmyproject();

    public List<UsersOnProject> getAllKeys(UsersOnProject p_user)
    {
        return DALmyproject.getAllKeys(p_user);
    }

}