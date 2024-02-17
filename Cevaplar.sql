1) ÖRNEK SORU: Öğrenci tablosundaki tüm kayıtları listeleyin.

	CEVAP: SELECT * FROM ogrenci;


2) Öğrenci tablosundaki öğrencinin adını ve soyadını ve sınıfını listeleyin.

	CEVAP: SELECT ograd, ogrsoyad FROM ogrenci;


3) Öğrenci tablosundaki kız öğrencileri listeleyin. 

 	CEVAP: SELECT * FROM ogrenci WHERE cinsiyet LIKE 'K';


4) Öğrenci tablosunda kaydı bulunan sınıfların adını her sınıf bir kez görüntülenecek şekilde listeleyiniz

	CEVAP: SELECT DISTINCT sinif FROM ogrenci;


5) Öğrenci tablosunda, 10A sınıfında olan kız öğrencileri listeleyiniz.

	CEVAP: SELECT * FROM ogrenci WHERE cinsiyet='K' AND sinif='10A';


6) Öğrenci tablosundaki 10A veya 10B sınıfındaki öğrencilerin adını, soyadını ve sınıfını listeleyiniz.

	CEVAP: SELECT ograd, ogrsoyad, sinif FROM ogrenci WHERE sinif='10A' OR sinif='10B';
	

7) Öğrenci tablosundaki öğrencinin adını, soyadını ve numarasını okul numarası olarak listeleyiniz. (as kullanım örneği)

	CEVAP: SELECT ograd, ogrsoyad, ogrno AS "okul_numarası" FROM ogrenci;
	

8) Öğrenci tablosundaki öğrencinin adını ve soyadını birleştirip, adsoyad olarak listeleyiniz. (concat, as kullanım örneği)

	CEVAP: SELECT CONCAT (ograd, ' ', ogrsoyad) AS "ad_soyad" FROM ogrenci;
	

9) Öğrenci tablosundaki Adı ‘A’ harfi ile başlayan öğrencileri listeleyiniz.

	CEVAP: SELECT * FROM ogrenci WHERE ograd LIKE 'a%';
	

10) Kitaplar tablosundaki sayfa sayısı 50 ile 200 arasında olan kitapların adını ve sayfa sayısını listeleyiniz.

	CEVAP: SELECT kitapadi, sayfasayisi FROM kitap WHERE sayfasayisi BETWEEN 50 AND 200;
	
	
11) Öğrenci tablosunda adı Fidan, İsmail ve Leyla olan öğrencileri listeleyiniz.

	CEVAP: SELECT * FROM ogrenci WHERE ograd IN ('Fidan', 'İsmail', 'Leyla');
	

12) Öğrenci tablosundaki öğrencilerden adı A, D ve K ile başlayan öğrencileri listeleyiniz.

	CEVAP: SELECT * FROM ogrenci WHERE ograd LIKE 'A%' OR ograd LIKE 'D%' OR ograd LIKE 'K%';
	

13) Öğrenci tablosundaki sınıfı 9A olan Erkekleri veya sınıfı 9B olan kızların adını, soyadını, sınıfını ve cinsiyetini listeleyiniz.

	CEVAP: SELECT ograd, ogrsoyad, sinif, cinsiyet FROM ogrenci WHERE sinif='9A' AND cinsiyet='E' OR sinif='9B' AND cinsiyet='K';
	

14) Sınıfı 10A veya 10B olan erkekleri listeleyiniz.

	CEVAP: SELECT * FROM ogrenci WHERE (cinsiyet='E' AND sinif='10A') OR (cinsiyet='E' AND sinif='10B');
		   SELECT * FROM ogrenci WHERE sinif IN ('10A', '10B') AND cinsiyet='E';
		   

15) Öğrenci tablosunda doğum yılı 1989 olan öğrencileri listeleyiniz.

	CEVAP: SELECT * FROM ogrenci WHERE EXTRACT(YEAR FROM dtarih) = 1989;
	

16) Öğrenci numarası 30 ile 50 arasında olan Kız öğrencileri listeleyiniz.

	CEVAP: SELECT * FROM ogrenci WHERE cinsiyet='K' AND ogrno BETWEEN 30 AND 50;
	

17) Öğrencileri adına göre sıralayınız (alfabetik).

	CEVAP: SELECT * FROM ogrenci ORDER BY ograd ASC;
	

18) Öğrencileri adına, adı aynı olanlarıda soyadlarına göre sıralayınız.

	CEVAP: SELECT * FROM ogrenci ORDER BY ograd, ogrsoyad;
	

19) 10A sınıfındaki öğrencileri okul numarasına göre azalan olarak sıralayınız.

	CEVAP: SELECT * FROM ogrenci WHERE sinif='10A' ORDER BY ogrno;
	
	
20) Öğrenciler tablosundaki ilk 10 kaydı listeleyiniz.
[İPUCU: `Select top tüm mysql versiyonlarında düzgün çalışmaz. LİMİT kullanmak daha faydalıdır`]

	CEVAP: SELECT * FROM ogrenci LIMIT 10;
	
	
21) Öğrenciler tablosundaki ilk 10 kaydın ad, soyad ve doğum tarihi bilgilerini listeleyiniz.

	CEVAP: SELECT ograd, ogrsoyad, dtarih FROM ogrenci LIMIT 10;
	

22) Sayfa sayısı en fazla olan kitabı listeleyiniz.

	CEVAP: SELECT * FROM kitap ORDER BY sayfasayisi DESC LIMIT 1;
	

23) Öğrenciler tablosundaki en genç öğrenciyi listeleyiniz.

	CEVAP: SELECT * FROM ogrenci ORDER BY dtarih DESC LIMIT 1;
	

24) 10A sınıfındaki en yaşlı öğrenciyi listeyin.

	CEVAP: SELECT * FROM ogrenci WHERE sinif='10A' AND dtarih IS NOT null ORDER BY dtarih ASC LIMIT 1;
	

25) İkinci harfi N olan kitapları listeleyiniz.

	CEVAP: SELECT * FROM kitap WHERE kitapadi LIKE '_N%';
	

26) Öğrencileri sınıflarına göre gruplayarak listeleyin.

	CEVAP: SELECT * FROM ogrenci ORDER BY sinif;
	

27) Öğrencileri her sorgulamada sıralaması farklı olacak şekilde rastgele listeleyin. 
[İPUCU: rand() fonksiyonu]

	CEVAP: SELECT * FROM ogrenci ORDER BY rand();
	

28) Öğrenci tablosundan Rastgele bir öğrenci seçiniz.

	CEVAP: SELECT * FROM ogrenci ORDER BY rand() LIMIT 1;
	

29) 10A sınıfından rastgele bir öğrencinin adını, soyadını, numarasını ve sınıfını getirin.

	CEVAP:  SELECT ograd, ogrsoyad, ogrno, sinif FROM ogrenci WHERE sinif='10A' ORDER BY rand() LIMIT 1;
	

# Esnek
30) Öğrenci tablosunda aynı isimde kaçar öğrenci olduğunu bulmak istiyoruz. 
Öğrenci isimlerinin sayısını "adet" olarak öğrencilerin isimleri "isim" olarak listeleyin. 
[İPUCU: count() ve group by]

	CEVAP: SELECT ograd AS isim, COUNT(*) AS adet FROM ogrenci GROUP BY ograd ORDER BY adet DESC;