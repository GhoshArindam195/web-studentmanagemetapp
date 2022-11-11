package com.web_employeemanagementsystem.helper;
public class ValidateForm
{
    public static boolean validateName(String user_name)
    {
        int len = user_name.length();
        for(int i=0; i<len; i++)
        {
            char ch = user_name.charAt(i);
            
            if(Character.isDigit(ch))
            {
                return false;
            }
            
            if(!Character.isLetterOrDigit(ch) && !Character.isWhitespace(ch))
            {
                return false;
            }
            
        }
        
        return true;
    }
    
    public static boolean validateEmail(String user_email)
    {   
        //ghosharindam@gmail.com    -> valid
        //ghosh.arindam@gmail.com   -> valid
        //ghosh.arindam@gmailcom    -> invalid
        
        try
        {
            String splitEmail[] = user_email.split("@");
            //user_email should have exactly one '@', not more not less. Otherwise invalid
            if(splitEmail.length != 2)
            {
                return false;
            }
            
            String splitDomain[] =  splitEmail[1].split("[.]");
            //in domain there should be exactly one '.', not more not less. Otherwise invalid
            if(splitDomain.length != 2)
            {
                return false;
            }
            
            
        } 
        catch (Exception e) 
        {
            return false;
        }        
        return true;
    }
    public static int validatePwds(String user_pwd, String repeat_user_pwd)
    {        
        try
        {
            //returning 1 means passwords are mismatched..
            if(!user_pwd.equals(repeat_user_pwd))
            {
                return 1;
            }
            int pwdLen = user_pwd.length();
            //1. length should be atleast 6 chars........
            if(pwdLen<6)
            {
                return 2;
            }
            //2. it shouldn't have any blank space.........
            if(user_pwd.contains(" "))
            {
                return 2;
            }
            //3. should have atleast one upper case...........
            if(getUpperCount(user_pwd, pwdLen) <=0)
            {
                return 2;
            }
            //4. should have atleast one lower case...........
            if(getLowerCount(user_pwd, pwdLen) <=0)
            {
                return 2;
            }
            //5. should have atleast two digits....
            if(getDigitCount(user_pwd, pwdLen) <=1)
            {
                return 2;
            }
            //6. should have atleast two special symbols....
            if(getSpecialSymbolCount(user_pwd, pwdLen)<= 1)
            {
                return 2;
            }
        } 
        catch (Exception e) 
        {
            return 2;
        }       
        
        //returning 0 means everything is fine in password.
        return 0;
    }
    
    private static int getDigitCount(String user_pwd, int len)
    {
        int digitCount=0;
        for(int i=0; i<len; i++)
        {
            char ch = user_pwd.charAt(i);
            if(ch>='0' && ch<='9')
                digitCount++;
        }
        return digitCount;
    }
    
    private static int getUpperCount(String user_pwd, int len)
    {
        int upperCount=0;
        for(int i=0; i<len; i++)
        {
            char ch = user_pwd.charAt(i);
            if(ch>='A' && ch<='Z')
                upperCount++;
        }
        return upperCount;
    }
    
    private static int getLowerCount(String user_pwd, int len)
    {
        int lowerCount=0;
        for(int i=0; i<len; i++)
        {
            char ch = user_pwd.charAt(i);
            if(ch>='a' && ch<='z')
                lowerCount++;
        }
        return lowerCount;
    }
    
    private static int getSpecialSymbolCount(String user_pwd, int len)
    {
        int specialCount=0;
        for(int i=0; i<len; i++)
        {
            char ch = user_pwd.charAt(i);
            if(!Character.isLetterOrDigit(ch))
                specialCount++;
        }
        return specialCount;
    }
    
    
    
    
    
    
}
