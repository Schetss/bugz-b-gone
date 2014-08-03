using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLresponsible
/// </summary>
public class BLLresponsible
{
    DALresponsible DALresponsible = new DALresponsible();

    public List<UsersOnProject> getAllUsers(UsersOnProject p_project)
    {
        return DALresponsible.getAllUsers(p_project);
    }
}