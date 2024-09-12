
//============================================================================//
//                         31 sistemi - Version 1.0.0                         //
//                           Developed by SkyChord                            //
//============================================================================//
/*

 _|_|_|            _|    _|      _|            _|
   _|    _|_|_|        _|_|_|_|        _|_|_|  _|
   _|    _|    _|  _|    _|      _|  _|    _|  _|
   _|    _|    _|  _|    _|      _|  _|    _|  _|
 _|_|_|  _|    _|  _|      _|_|  _|    _|_|_|  _|


                   _|_|_|                      _|              _|
                 _|          _|_|_|  _|  _|_|      _|_|_|    _|_|_|_|    _|_|_|
                   _|_|    _|        _|_|      _|  _|    _|    _|      _|_|
                       _|  _|        _|        _|  _|    _|    _|          _|_|
                 _|_|_|      _|_|_|  _|        _|  _|_|_|        _|_|  _|_|_|
                                                   _|
                                                   _|

*/
//============================================================================//
//                                      Copyright (c) 2013 - Initial Scripts  //
//============================================================================//

// ========================(( #Kütüphaneler ))=============================== //
#include <a_samp>  // - SA:MP Include | 0.3x | Developed by SA:MP Team

// =========================(( #Değişkenler ))=============================== //
#define FILTERSCRIPT // - Filterscript tanıtımı.

// - Sistem mesajları:
#define MASS_CONSOLE(%0) printf("[31 SYSTEM]: "%0)
#define MASS_BILGI(%0,%1) SendClientMessage(%0,0xFF0000,"{#2F2F2F}[ {#4A627F}BİLGİ {#2F2F2F}]: {4A627F}" %1)
#define MASS_31_KULLANIM(%0) SendClientMessage(%0,0xFF0000,"{#2F2F2F}[ {#841594}KULLANIM {#2F2F2F}]: {841594}/31 {#2F2F2F}[{#841594}cek{#2F2F2F}/{#841594}birak{#2F2F2F}/{#841594}yardim{#2F2F2F}]")
#define MASS_FER_KULLANIM(%0) SendClientMessage(%0,0xFF0000,"{#2F2F2F}[ {#841594}KULLANIM {#2F2F2F}]: {841594}/fermuar {#2F2F2F}[{#841594}ac{#2F2F2F}/{#841594}kapat{#2F2F2F}]")

// - Tanıtımlar:
new MASSFERMUAR[MAX_PLAYERS] = 0;
new MASSCEKIYOR[MAX_PLAYERS] = 0;
new MASSEREKSIYON[MAX_PLAYERS] = 0;

// ===========================(( #Public ))================================== //
#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	MASS_CONSOLE("====================================");
	MASS_CONSOLE("         31 System - v1.0.0         ");
	MASS_CONSOLE("        Developed by SkyChord       ");
	MASS_CONSOLE("Copyright (c) 2013 - Initial Scripts");
	MASS_CONSOLE("====================================");
	MASS_CONSOLE("31 sistemi başarıyla başlatıldı.");
	return 1;
}

public OnFilterScriptExit()
{
	MASS_CONSOLE("====================================");
	MASS_CONSOLE("         31 System - v1.0.0         ");
	MASS_CONSOLE("        Developed by SkyChord       ");
	MASS_CONSOLE("Copyright (c) 2013 - Initial Scripts");
	MASS_CONSOLE("====================================");
	MASS_CONSOLE("31 sistemi başarıyla kapatıldı.");
	return 1;
}

#else

main()
{
	MASS_CONSOLE("====================================");
	MASS_CONSOLE("         31 System - v1.0.0         ");
	MASS_CONSOLE("        Developed by SkyChord       ");
	MASS_CONSOLE("Copyright (c) 2013 - Initial Scripts");
	MASS_CONSOLE("====================================");
	MASS_CONSOLE("31 sistemi başarıyla başlatıldı.");
}

#endif

public OnPlayerConnect(playerid)
{
	// - Sıfırlamalar.
	MASSFERMUAR[playerid] = 0;
	MASSCEKIYOR[playerid] = 0;
	MASSEREKSIYON[playerid] = 0;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	// - Sıfırlamalar.
	MASSFERMUAR[playerid] = 0;
	MASSCEKIYOR[playerid] = 0;
	MASSEREKSIYON[playerid] = 0;
	return 1;
}

public OnPlayerSpawn(playerid)
{
	// - Sıfırlamalar.
	MASSFERMUAR[playerid] = 0;
	MASSCEKIYOR[playerid] = 0;
	MASSEREKSIYON[playerid] = 0;
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(MASSCEKIYOR[playerid] == 1) return MASS_BILGI(playerid,"Öldüğünüz için mastürbasyonunuz sona erdi.");
	// - Sıfırlamalar.
	MASSFERMUAR[playerid] = 0;
	MASSCEKIYOR[playerid] = 0;
	MASSEREKSIYON[playerid] = 0;
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256],idx;
	cmd=strtok(cmdtext,idx);
	
	if(!strcmp(cmd,"/fermuar",true))
	{
        new tmp[256];
	    tmp=strtok(cmdtext,idx);
	    if(!strlen(tmp)) return MASS_FER_KULLANIM(playerid);
	    
		if(!strcmp("ac",tmp,true))
		{
		if(MASSFERMUAR[playerid] != 0) return MASS_BILGI(playerid,"Fermuarınız zaten açık!");
		
		MASSFERMUAR[playerid] = 1;
		MASS_BILGI(playerid,"Fermuarınızı açtınız!");
		}
 		if(!strcmp("kapat",tmp,true))
		{
		if(MASSFERMUAR[playerid] != 1) return MASS_BILGI(playerid,"Fermuarınız zaten kapalı!");
		
		MASSFERMUAR[playerid] = 0;
		MASS_BILGI(playerid,"Fermuarınızı kapattınız!");
		}
	}
	
	if(!strcmp(cmd,"/31",true))
	{
	    new tmp[256];
	    tmp=strtok(cmdtext,idx);
	    if(!strlen(tmp)) return MASS_31_KULLANIM(playerid);

		if(!strcmp("cek",tmp,true))
		{
		if(MASSFERMUAR[playerid] != 1) return MASS_BILGI(playerid,"Fermuarınızı açmadan çekemezsiniz!");
		if(MASSCEKIYOR[playerid] != 0) return MASS_BILGI(playerid,"Zaten mastürbasyon çekiyorsunuz!");
		
		MASS_BILGI(playerid,"Mastürbasyon çekilmeye başlandı.");
		MASSCEKIYOR[playerid] = 1;
		ApplyAnimation(playerid, "OTB", "wtchrace_win",4.1,0,1,1,0,3300);
		}

		if(!strcmp("birak",tmp,true))
		{
		if(MASSCEKIYOR[playerid] != 1) return MASS_BILGI(playerid,"Zaten mastürbasyon çekmiyorsunuz!");
		
		MASS_BILGI(playerid,"Mastürbasyon bırakıldı.");
		MASSCEKIYOR[playerid] = 0;
		
		if(MASSEREKSIYON[playerid] == 1)
		{
		MASS_BILGI(playerid,"1 dakika boyunca ereksiyon halinde olacaksınız.");
		} else {
		MASS_BILGI(playerid,"Şimdi {FFFFFF}/fermuarkapat {4A627F}yazıp penisinizi görünmez hale getirebilirsiniz!");
		}
		}
	}
	return 0;
}

// ============================(( #Diğer ))================================== //

// - strtok | Developed by SA:MP Team
strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

//============================================================================//
//                              SkyChord Scripts                              //
//                          - 31 SİSTEMİ / v1.0.0 -                           //

//                           - SİSTEM AÇIKLAMASI -                            //
/* Merhaba arkadaşlar, bu sistemi uzun zamandır düşünüyordum, yapmak için
sonunda vakit buldum ve sizin için uygun hale getirdim. Umarım beğenirsiniz.
*/
//                          - SİSTEM ÖZELLİKLERİ -                            //
/*
- Komutlar:

> /31 cek           ==    Mastürbasyona başlarsınız.
> /31 birak         ==    Asılmayı bırakırsınız.
> /31 yardim        ==    Komutlar hakkında bilgi sayfası açılır.
> /fermuar ac       ==    Fermuarı açar, 31 çekmeden önce gerekli.
> /fermuar kapat    ==    Bu komutla penisinizi gizleyebilirsiniz.

- Özellikler:

-> Fermuar açtığınızda penis objesi belirir.
+> Fermuar açmadan 31 çekemezsiniz.
+> Çekmeye başladığınızda animasyon başlar.
-> Çekmeye başladıktan bir süre sonra ereksiyon haline geçersiniz.
-> Çekmeye başladıktan 3 dakika sonra boşalırsınız. (Ayarlanabilir.)
-> Boşaldıktan sonra 5 dakika boyunca 31 çekemezsiniz. (Ayarlanabilir.)
-> Boşalırken kısa bir süreliğine obje çıkar.
-> Çekmeyi bıraktığınızda ereksiyon halindeyken normal haline gelir.
Normal halindeyken öylece kalır.
-> Fermuar kapattığınızda obje (yani penisiniz) kaybolur.

*/
//============================================================================//

