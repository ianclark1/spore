<cfcomponent output="false">

<cffunction name="getAchievementsForUser" access="public" returnType="array" output="false" hint="Get number of achievements for user and a list of achievement ids and unlock-dates">
	<cfargument name="username" type="string" required="true">
	<cfargument name="startIndex" type="numeric" required="true" hint="SporeAPI is 0 based here. We do it the right way. Send a 'normal' index and I'll subtract one.">
	<cfargument name="length" type="numeric" required="true">

	<cfset var theUrl = "http://www.spore.com/rest/achievements/#arguments.username#/#arguments.startIndex-1#/#arguments.length#">
	<cfset var result = "">
	<cfset var achievements = []>
	<cfset var packet = "">
	<cfset var x = "">
	
	<cfhttp url="#theUrl#" result="result">
	<cfset packet = xmlParse(result.fileContent)>
	
	<cfif not structKeyExists(packet.achievements,"achievement")>
		<cfreturn achievements>
	</cfif>
	
	<cfloop index="x" from="1" to="#arrayLen(packet.achievements.achievement)#">	
		<cfset arrayAppend(achievements, quickParse(packet.achievements.achievement[x]))>
	</cfloop>

	<cfreturn achievements>
</cffunction>

<cffunction name="getAsset" access="public" returnType="struct" output="false" hint="For a given asset id, get name, description, tags, 10 latest comments, type, parent, rating, creation date and author name/id">
	<cfargument name="assetId" type="string" required="true">
	<cfset var theUrl = "http://www.spore.com/rest/asset/#arguments.assetId#">
	<cfset var result = "">

	<cfhttp url="#theUrl#" result="result">
	<cfreturn quickParse(result.fileContent)>

</cffunction>

<cffunction name="getAssetsForUser" access="public" returnType="array" output="false" hint="Get asset id, name, creation date, type, parent and rating for a list of assets created by a user">
	<cfargument name="username" type="string" required="true">
	<cfargument name="startIndex" type="numeric" required="true" hint="SporeAPI is 0 based here. We do it the right way. Send a 'normal' index and I'll subtract one.">
	<cfargument name="length" type="numeric" required="true">

	<cfset var theUrl = "http://www.spore.com/rest/assets/user/#arguments.username#/#arguments.startIndex-1#/#arguments.length#">
	<cfset var result = "">
	<cfset var assets = []>
	<cfset var packet = "">
	<cfset var x = "">
	
	<cfhttp url="#theUrl#" result="result">
	<cfset packet = xmlParse(result.fileContent)>
	
	<cfif not structKeyExists(packet.assets,"asset")>
		<cfreturn assets>
	</cfif>
	
	<cfloop index="x" from="1" to="#arrayLen(packet.assets.asset)#">	
		<cfset arrayAppend(assets, quickParse(packet.assets.asset[x]))>
	</cfloop>

	<cfreturn assets>
</cffunction>

<cffunction name="getAssetsForSporecast" access="public" returnType="array" output="false" hint="Get asset id, and name for assets in a sporecast ">
	<cfargument name="sporecastid" type="string" required="true">
	<cfargument name="startIndex" type="numeric" required="true" hint="SporeAPI is 0 based here. We do it the right way. Send a 'normal' index and I'll subtract one.">
	<cfargument name="length" type="numeric" required="true">

	<cfset var theUrl = "http://www.spore.com/rest/assets/sporecast/#arguments.sporecastid#/#arguments.startIndex-1#/#arguments.length#">
	<cfset var result = "">
	<cfset var assets = []>
	<cfset var packet = "">
	<cfset var x = "">
	
	<cfhttp url="#theUrl#" result="result">
	<cfset packet = xmlParse(result.fileContent)>
	
	<cfif not structKeyExists(packet.assets,"asset")>
		<cfreturn assets>
	</cfif>
	
	<cfloop index="x" from="1" to="#arrayLen(packet.assets.asset)#">	
		<cfset arrayAppend(assets, quickParse(packet.assets.asset[x]))>
	</cfloop>

	<cfreturn assets>
</cffunction>

<cffunction name="getBuddiesForUser" access="public" returnType="array" output="false" hint="For a given username, get a list of buddy names and ids and total buddy count ">
	<cfargument name="username" type="string" required="true">
	<cfargument name="startIndex" type="numeric" required="true" hint="SporeAPI is 0 based here. We do it the right way. Send a 'normal' index and I'll subtract one.">
	<cfargument name="length" type="numeric" required="true">

	<cfset var theUrl = "http://www.spore.com/rest/users/buddies/#arguments.username#/#arguments.startIndex-1#/#arguments.length#">
	<cfset var result = "">
	<cfset var buddies = []>
	<cfset var packet = "">
	<cfset var x = "">
	
	<cfhttp url="#theUrl#" result="result">
	<cfset packet = xmlParse(result.fileContent)>
	
	<cfif not structKeyExists(packet.users,"buddy")>
		<cfreturn buddies>
	</cfif>
	
	<cfloop index="x" from="1" to="#arrayLen(packet.users.buddy)#">	
		<cfset arrayAppend(buddies, quickParse(packet.users.buddy[x]))>
	</cfloop>

	<cfreturn buddies>
</cffunction>

<cffunction name="getCommentsForAsset" access="public" returnType="array" output="false" hint="For a given asset id, get a list of comments, sender names and comment dates">
	<cfargument name="assetid" type="string" required="true">
	<cfargument name="startIndex" type="numeric" required="true" hint="SporeAPI is 0 based here. We do it the right way. Send a 'normal' index and I'll subtract one.">
	<cfargument name="length" type="numeric" required="true">

	<cfset var theUrl = "http://www.spore.com/rest/comments/#arguments.assetid#/#arguments.startIndex-1#/#arguments.length#">
	<cfset var result = "">
	<cfset var comments = []>
	<cfset var packet = "">
	<cfset var x = "">
	
	<cfhttp url="#theUrl#" result="result">
	<cfset packet = xmlParse(result.fileContent)>
	
	<cfif not structKeyExists(packet.comments,"comment")>
		<cfreturn comments>
	</cfif>
	
	<cfloop index="x" from="1" to="#arrayLen(packet.comments.comment)#">	
		<cfset arrayAppend(comments, quickParse(packet.comments.comment[x]))>
	</cfloop>

	<cfreturn comments>
</cffunction>

<cffunction name="getCreatureStats" access="public" returnType="struct" output="false" hint="Get various stats like height, diet, abilities etc. for a creature, if you know it's asset Id">
	<cfargument name="creatureAssetId" type="string" required="true">
	<cfset var theUrl = "http://www.spore.com/rest/creature/#arguments.creatureAssetId#">
	<cfset var result = "">

	<cfhttp url="#theUrl#" result="result">
	<cfreturn quickParse(result.fileContent)>

</cffunction>

<cffunction name="getDailyStats" access="public" returnType="struct" output="false" hint="Get daily stats about Spore.com">
	<cfset var theUrl = "http://www.spore.com/rest/stats">
	<cfset var result = "">
	
	<cfhttp url="#theUrl#" result="result">
	<cfreturn quickParse(result.fileContent)>

</cffunction>

<cffunction name="getProfileInfo" access="public" returnType="struct" output="false" hint="Get profile pic, tagline, user id and creation date for a username">
	<cfargument name="username" type="string" required="true">
	<cfset var theUrl = "http://www.spore.com/rest/user/#arguments.username#">
	<cfset var result = "">

	<cfhttp url="#theUrl#" result="result">
	<cfreturn quickParse(result.fileContent)>

</cffunction>

<cffunction name="getSpecialSearch" access="public" returnType="array" output="false" hint="List creations for a given view.">
	<cfargument name="viewType" type="string" required="true" hint="One of: TOP_RATED, TOP_RATED_NEW, NEWEST, FEATURED, MAXIS_MADE, RANDOM, CUTE_AND_CREEPY">
	<cfargument name="startIndex" type="numeric" required="true" hint="SporeAPI is 0 based here. We do it the right way. Send a 'normal' index and I'll subtract one.">
	<cfargument name="length" type="numeric" required="true">
	<cfargument name="assetType" type="string" required="false" hint="One of: UFO, CREATURE, BUILDING, VEHICLE">
	
	<cfset var theUrl = "http://www.spore.com/rest/assets/search/#arguments.viewType#/#arguments.startIndex-1#/#arguments.length#">
	<cfset var result = "">
	<cfset var assets = []>
	<cfset var packet = "">
	<cfset var x = "">
	
	<cfif structKeyExists(arguments, "assetType")>
		<cfset theUrl &= "/#arguments.assetType#">
	</cfif>
	
	<cfhttp url="#theUrl#" result="result">
	<cfset packet = xmlParse(result.fileContent)>
	
	<cfif not structKeyExists(packet.assets,"asset")>
		<cfreturn assets>
	</cfif>
	
	<cfloop index="x" from="1" to="#arrayLen(packet.assets.asset)#">	
		<cfset arrayAppend(assets, quickParse(packet.assets.asset[x]))>
	</cfloop>

	<cfreturn assets>

</cffunction>

<cffunction name="getSporecastsForUser" access="public" returnType="array" output="false" hint="Get id, name, tags, subscription count, rating etc. for Sporecasts subscribed to by a user">
	<cfargument name="username" type="string" required="true">

	<cfset var theUrl = "http://www.spore.com/rest/sporecasts/#arguments.username#">
	<cfset var result = "">
	<cfset var sporecasts = []>
	<cfset var packet = "">
	<cfset var x = "">
	
	<cfhttp url="#theUrl#" result="result">
	
	<cfset packet = xmlParse(result.fileContent)>
	
	<cfif not structKeyExists(packet.sporecasts,"sporecast")>
		<cfreturn sporecasts>
	</cfif>
	
	<cfloop index="x" from="1" to="#arrayLen(packet.sporecasts.sporecast)#">	
		<cfset arrayAppend(sporecasts, quickParse(packet.sporecasts.sporecast[x]))>
	</cfloop>

	<cfreturn sporecasts>
	
</cffunction>

<cffunction name="quickParse" access="private" returnType="struct" output="false" hint="Most (all?) of Spore's APIs are very simple XML docs.">
	<cfargument name="xmlpacket" type="string" required="true">
	<cfset var packet = xmlParse(arguments.xmlpacket)>
	<cfset var top = structKeyList(packet)>
	<cfset var s = {}>
	<cfset var k = "">
	
	<cfloop item="k" collection="#packet[top]#">
		<cfset s[k] = packet[top][k].xmlText>
	</cfloop>
	
	<cfreturn s>

</cffunction>

</cfcomponent>