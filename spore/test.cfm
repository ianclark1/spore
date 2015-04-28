
<cfset spore = createObject("component", "spore")>

<cfdump var="#spore.getDailyStats()#">

<cfdump var="#spore.getCreatureStats('500267423060')#" expand="false">

<cfdump var="#spore.getProfileInfo('MaxisDangerousYams')#" expand="false">

<cfdump var="#spore.getAssetsForUser('MaxisCactus',1,3)#" expand="false">

<cfdump var="#spore.getSporecastsForUser('MaxisMichael')#" expand="false" label="Sporecasts for User">

<cfdump var="#spore.getAssetsForSporecast('500190457259',1,3)#" expand="false">

<cfdump var="#spore.getAchievementsForUser('MaxisLucky',1,3)#" expand="false">

<cfdump var="#spore.getAsset('500005649853')#" expand="false">

<cfdump var="#spore.getCommentsForAsset('500226147573',1,3)#" expand="false">

<cfdump var="#spore.getBuddiesForUser('MaxisDangerousYams',1,3)#" expand="false">

<cfdump var="#spore.getSpecialSearch('CUTE_AND_CREEPY',1,3)#" expand="false">

<cfset topUFOs = spore.getSpecialSearch('TOP_RATED',1,3,'UFO')>
<cfdump var="#topUFOs#" expand="false">

<cfloop index="a" array="#topUFOs#">
	<cfoutput><img src="#a.thumb#"></cfoutput>
</cfloop>