 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DALlogin
/// </summary>
public class DALlogin
{
	private BugzDataContext dc = new BugzDataContext();

    public List<ProductUser> checkLogin(ProductUser p_productuser) 
    {
        var query =
            from t in dc.ProductUsers
            where t.username == p_productuser.username
            where t.password == p_productuser.password
            select t;

        List<ProductUser> x = query.ToList();

        if (x.Count > 0)
        {
           
            return x;
        }

        else
        {
            throw new Exception("Username or passwordis not correct!");
        }
    }

    public int getStatus(ProductUser p_status)
    {
        var query =
            from t in dc.ProductUsers
            where t.username == p_status.username
            where t.password == p_status.password
            where t.fk_usertype == 1
            select t;

        List<ProductUser> x = query.ToList();

        if (x.Count > 0)
        {
            return 1;
        }
        else
        {
            return 2;
        }
    }

    public int getUserID(ProductUser p_id)
    {
        var query =
            from t in dc.ProductUsers
            where t.username == p_id.username
            where t.password == p_id.password
            select t;

        List<ProductUser> x = query.ToList();

        int z = 0;

        foreach(var y in x)
        {
            z = y.pk_productuser_id;

        }

        return z;

    }

    
   

}