show tables;

select * from learning_aspirations;

select * from manager_aspirations;

select * from mission_aspirations;

select * from personalized_info;



select pi.ResponseID,pi.Timestamp,pi.CurrentCountry,pi.ZipCode,pi.Gender,mi.MisalignedMissionLikelihood,mi.NoSocialImpactLikelihood,mi.LaidOffEmployees,mi.ExpectedSalary3Years,mi.ExpectedSalary5Years,mi.MissionUndefinedLikelihood,ma.WorkLikelihood3Years,ma.PreferredEmployer,ma.PreferredManager,ma.PreferredWorkSetup,ma.Worklikelihood7years,ln.CareerInfluenceFactor,ln.HigherEducationAbroad,ln.PreferredWorkingEnvironment,ln.ZipCode,ln.ClosestAspirationalCareer from personalized_info as pi join mission_aspirations as mi on pi.ResponseID = mi.ResponseID join manager_aspirations as ma on pi.ResponseID = ma.ResponseID join learning_aspirations as ln on pi.ResponseID = ln.ResponseID;

select count(pi.Gender) from personalized_info as pi where pi.currentcountry = 'India';

#QUESTION #1
select count(*) from personalized_info where Gender = 'Male\r'and currentcountry = 'India';

#QUESTION #2
select count(*) from personalized_info where Gender = 'Female\r' and currentcountry = 'India';

#QUESTION #3
select count(*) as InfluencedbyParents from learning_aspirations where CareerInfluenceFactor = 'My Parents';

#QUESTION #4
select count(*) as Female from personalized_info as pi JOIN learning_aspirations as ln on pi.ResponseID = ln.ResponseID Where pi.currentcountry = 'India' and pi.Gender = 'Female\r' AND ln.CareerInfluenceFactor = 'My Parents';

#QUESTION #5
select count(*) as Male from personalized_info as pi JOIN learning_aspirations as ln on pi.ResponseID = ln.ResponseID Where pi.currentcountry = 'India' and pi.Gender = 'Male\r' AND ln.CareerInfluenceFactor = 'My Parents';

#QUESTION #6
select 
count(case when pi.Gender like "male%" then 1 end ) as Male,count(case when pi.Gender like "female%" then 1 end ) as Female from personalized_info as pi JOIN learning_aspirations as ln on pi.ResponseID = ln.ResponseID Where pi.currentcountry = 'India' AND ln.CareerInfluenceFactor = 'My Parents';

#QUESTION #7
select 
count(case when ln.careerinfluencefactor like "social%" then 1 end) as media,
count(case when ln.careerinfluencefactor like "influencers%" then 1 end) as influencers
from personalized_info as pi
inner join learning_aspirations as ln
on pi.responseID=ln.responseID
where pi.currentcountry="india";

#QUESTION #8
select careerinfluencefactor, 
count(case when pi.gender like "female%" then 1 end) as female_aspirants,
count(case when pi.gender like "male%" then 1 end) as male_aspirants
from personalized_info as pi 
inner join learning_aspirations as ln
on pi.responseID=l.responseID
where p.currentcountry="india"
group by ln.careerinfluencefactor
limit 2 offset 1;

#QUESTION #9
select count(*) Genz_Aspirants from learning_aspirations as ln where ln.careerinfluencefactor like "social%" and ln.HigherEducationAbroad like 'yes%';

#QUESTION #10
select count(*) Genz_Aspirants from learning_aspirations as ln where ln.careerinfluencefactor like "%circle%" and ln.HigherEducationAbroad like 'yes%';




