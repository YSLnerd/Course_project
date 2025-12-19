--
-- PostgreSQL database dump
--

\restrict qBHgHXSdCpsUqRjEmcTbc1rtsyDwIf7LGFT2rBVMEkfMJraJkTBX01VLWugx15t

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-12-13 10:12:31

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 16542)
-- Name: acting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acting (
    id_acting integer NOT NULL,
    id_movie integer NOT NULL,
    id_actor integer NOT NULL
);


ALTER TABLE public.acting OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16600)
-- Name: acting_id_acting_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.acting ALTER COLUMN id_acting ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.acting_id_acting_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16489)
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors (
    id_actor integer NOT NULL,
    first_name text NOT NULL,
    second_name text NOT NULL,
    date_birth date,
    date_death date,
    actor_photo text,
    actor_country text,
    CONSTRAINT date_death CHECK ((date_death <= CURRENT_DATE)),
    CONSTRAINT date_dirth CHECK (((date_birth <= CURRENT_DATE) AND (date_birth <= (CURRENT_DATE - '18 years'::interval))))
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16599)
-- Name: actors_id_actor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.actors ALTER COLUMN id_actor ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.actors_id_actor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16526)
-- Name: directing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directing (
    id_directing integer NOT NULL,
    id_movie integer NOT NULL,
    id_director integer NOT NULL
);


ALTER TABLE public.directing OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16602)
-- Name: directing_id_directing_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.directing ALTER COLUMN id_directing ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.directing_id_directing_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16480)
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    id_director integer NOT NULL,
    first_name text NOT NULL,
    second_name text,
    date_birth date,
    date_death date,
    director_photo text,
    director_country text,
    CONSTRAINT date_death CHECK ((date_death <= CURRENT_DATE)),
    CONSTRAINT date_dirth CHECK (((date_birth <= CURRENT_DATE) AND (date_birth <= (CURRENT_DATE - '18 years'::interval))))
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16603)
-- Name: directors_id_director_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.directors ALTER COLUMN id_director ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.directors_id_director_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16456)
-- Name: favourite_movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favourite_movies (
    id_favourite_movies integer NOT NULL,
    id_movie integer NOT NULL,
    id_user integer NOT NULL
);


ALTER TABLE public.favourite_movies OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17599)
-- Name: favourite_movies_id_favourite_movies_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.favourite_movies ALTER COLUMN id_favourite_movies ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.favourite_movies_id_favourite_movies_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 16581)
-- Name: genre_movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre_movies (
    id_genre_movies integer NOT NULL,
    id_genre integer NOT NULL,
    id_movie integer NOT NULL
);


ALTER TABLE public.genre_movies OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16580)
-- Name: genre_movies_id_genre_movies_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_movies_id_genre_movies_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genre_movies_id_genre_movies_seq OWNER TO postgres;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 226
-- Name: genre_movies_id_genre_movies_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_movies_id_genre_movies_seq OWNED BY public.genre_movies.id_genre_movies;


--
-- TOC entry 225 (class 1259 OID 16568)
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    id_genre integer NOT NULL,
    name text NOT NULL,
    name_ru text NOT NULL
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16567)
-- Name: genres_id_genre_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_id_genre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genres_id_genre_seq OWNER TO postgres;

--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 224
-- Name: genres_id_genre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_id_genre_seq OWNED BY public.genres.id_genre;


--
-- TOC entry 218 (class 1259 OID 16447)
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    title text NOT NULL,
    orig_title text NOT NULL,
    rus_title text,
    release_date date NOT NULL,
    poster_url text,
    length integer NOT NULL,
    id_movie integer NOT NULL,
    age_rating text NOT NULL,
    mood text NOT NULL,
    CONSTRAINT release_date CHECK ((release_date <= CURRENT_DATE))
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17752)
-- Name: movies_id_movie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.movies ALTER COLUMN id_movie ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.movies_id_movie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16433)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_user integer NOT NULL,
    nickname text NOT NULL,
    password text NOT NULL,
    role text NOT NULL,
    prof_pic_link text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16817)
-- Name: users_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4736 (class 2604 OID 16584)
-- Name: genre_movies id_genre_movies; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_movies ALTER COLUMN id_genre_movies SET DEFAULT nextval('public.genre_movies_id_genre_movies_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 16571)
-- Name: genres id_genre; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN id_genre SET DEFAULT nextval('public.genres_id_genre_seq'::regclass);


--
-- TOC entry 4930 (class 0 OID 16542)
-- Dependencies: 223
-- Data for Name: acting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.acting (id_acting, id_movie, id_actor) FROM stdin;
70	27977	417
71	27977	418
72	27977	419
73	54215	442
74	54215	443
75	54215	444
76	82971	126
77	82971	445
78	82971	446
79	95327	436
80	95327	437
81	95327	438
82	114814	377
83	114814	429
84	114814	430
85	180093	495
86	180093	496
87	180093	497
88	209144	159
89	209144	160
90	209144	161
91	76759	164
92	76759	126
93	76759	165
94	86190	164
95	86190	126
96	86190	165
97	95765	420
98	95765	421
99	95765	422
100	103064	498
101	103064	499
102	103064	427
103	112573	500
104	112573	501
105	112573	502
106	114709	216
107	114709	135
108	114709	431
109	119217	441
110	119217	182
111	119217	169
112	120586	426
113	120586	427
114	120586	428
115	120689	216
116	120689	413
117	120689	414
118	120815	216
119	120815	182
120	120815	423
121	133093	243
122	133093	244
123	133093	160
124	145487	503
125	145487	504
126	145487	291
127	167260	335
128	167260	117
129	167260	227
130	172495	142
131	172495	406
132	172495	432
133	180093	495
134	180093	496
135	180093	497
136	198781	424
137	198781	332
138	198781	425
139	241527	138
140	241527	140
141	241527	139
142	268978	142
143	268978	505
144	268978	497
145	298148	506
146	298148	507
147	298148	508
148	317705	415
149	317705	112
150	317705	416
151	330373	138
152	330373	139
153	330373	140
154	371746	114
155	371746	115
156	371746	116
157	373889	138
158	373889	139
159	373889	140
160	405159	322
161	405159	304
162	405159	323
163	449088	509
164	449088	336
165	449088	510
166	468569	202
167	468569	484
168	468569	485
169	482571	202
170	482571	141
171	482571	373
172	758758	386
173	758758	387
174	758758	388
175	892769	371
176	892769	153
177	892769	372
178	944835	339
179	944835	511
180	944835	186
181	974015	169
182	974015	512
183	974015	289
184	988045	114
185	988045	162
186	988045	163
187	1013752	513
188	1013752	514
189	1013752	515
190	1045658	516
191	1045658	188
192	1045658	220
193	1074638	222
194	1074638	517
195	1074638	211
196	1130884	187
197	1130884	518
198	1130884	175
199	1201607	138
200	1201607	139
201	1201607	140
202	1375666	187
203	1375666	439
204	1375666	440
205	1392170	188
206	1392170	274
207	1392170	196
208	1392190	519
209	1392190	520
210	1392190	521
211	1403865	181
212	1403865	182
213	1403865	183
214	1431045	271
215	1431045	276
216	1431045	522
217	1446714	523
218	1446714	524
219	1446714	525
220	1469304	399
221	1469304	400
222	1469304	401
223	1477834	289
224	1477834	290
225	1477834	291
226	1485796	141
227	1485796	526
228	1485796	400
229	1490017	359
230	1490017	527
231	1490017	528
232	1560747	406
233	1560747	529
234	1560747	171
235	1568911	530
236	1568911	531
237	1568911	532
238	1587310	339
239	1587310	268
240	1587310	340
241	1628841	196
242	1628841	197
243	1628841	198
244	1631867	209
245	1631867	333
246	1631867	334
247	1637688	380
248	1637688	381
249	1637688	382
250	1655442	533
251	1655442	534
252	1655442	332
253	1661199	320
254	1661199	535
255	1661199	536
256	1673434	193
257	1673434	194
258	1673434	195
259	1683526	147
260	1683526	148
261	1683526	149
262	1707386	141
263	1707386	142
264	1707386	143
265	1727824	144
266	1727824	145
267	1727824	146
268	1731141	126
269	1731141	208
270	1731141	183
271	1742044	150
272	1742044	151
273	1742044	152
274	1764651	247
275	1764651	196
276	1764651	537
277	1772341	349
278	1772341	350
279	1772341	351
280	1781769	510
281	1781769	162
282	1781769	538
283	1790864	539
284	1790864	540
285	1790864	541
286	1798709	406
287	1798709	171
288	1798709	373
289	1800302	542
290	1800302	543
291	1800302	544
292	1825683	249
293	1825683	246
294	1825683	250
295	1840309	213
296	1840309	214
297	1840309	215
298	1856101	126
299	1856101	190
300	1856101	545
301	1877832	546
302	1877832	227
303	1877832	141
304	1895587	175
305	1895587	176
306	1895587	163
307	1951264	188
308	1951264	274
309	1951264	196
310	1951265	188
311	1951265	274
312	1951265	196
313	1979320	547
314	1979320	548
315	1979320	549
316	1981677	297
317	1981677	550
318	1981677	551
319	2005151	316
320	2005151	317
321	2005151	318
322	2025690	172
323	2025690	173
324	2025690	174
325	2042568	330
326	2042568	331
327	2042568	332
328	2072233	154
329	2072233	356
330	2072233	357
331	2096673	307
332	2096673	308
333	2096673	309
334	2103281	133
335	2103281	552
336	2103281	553
337	2119532	310
338	2119532	311
339	2119532	312
340	2140479	169
341	2140479	297
342	2140479	353
343	2179136	516
344	2179136	554
345	2179136	110
346	2267998	169
347	2267998	555
348	2267998	556
349	2278871	224
350	2278871	557
351	2278871	558
352	2293640	344
353	2293640	559
354	2293640	176
355	2304933	407
356	2304933	408
357	2304933	409
358	2310332	227
359	2310332	228
360	2310332	229
361	2322441	402
362	2322441	403
363	2322441	560
364	2334873	535
365	2334873	561
366	2334873	562
367	2345759	209
368	2345759	563
369	2345759	564
370	2379713	222
371	2379713	223
372	2379713	224
373	2381249	209
374	2381249	107
375	2381249	210
376	2395427	114
377	2395427	177
378	2395427	175
379	2404435	358
380	2404435	359
381	2404435	360
382	2488496	565
383	2488496	566
384	2488496	330
385	2527336	565
386	2527336	566
387	2527336	164
388	2543472	199
389	2543472	200
390	2543472	201
391	2582782	172
392	2582782	174
393	2582782	181
394	2584384	567
395	2584384	568
396	2584384	373
397	2674426	569
398	2674426	570
399	2674426	571
400	2709768	572
401	2709768	573
402	2709768	574
403	2763304	257
404	2763304	258
405	2763304	259
406	2788710	178
407	2788710	179
408	2788710	180
409	2802144	134
410	2802144	575
411	2802144	112
412	2820852	513
413	2820852	514
414	2820852	399
415	2872718	113
416	2872718	576
417	2872718	334
418	2948356	577
419	2948356	378
420	2948356	578
421	2975590	169
422	2975590	170
423	2975590	171
424	2980516	324
425	2980516	325
426	2980516	326
427	3011894	579
428	3011894	580
429	3011894	581
430	3040964	582
431	3040964	583
432	3040964	491
433	3065204	296
434	3065204	584
435	3065204	585
436	3076658	246
437	3076658	247
438	3076658	248
439	3110958	586
440	3110958	175
441	3110958	287
442	3170832	355
443	3170832	199
444	3170832	366
445	3183660	324
446	3183660	587
447	3183660	588
448	3263904	216
449	3263904	485
450	3263904	589
451	3315342	141
452	3315342	546
453	3315342	590
454	3385516	591
455	3385516	525
456	3385516	188
457	3393786	209
458	3393786	292
459	3393786	293
460	3470600	542
461	3470600	592
462	3470600	593
463	3498820	177
464	3498820	114
465	3498820	373
466	3521164	594
467	3521164	399
468	3521164	595
469	3553976	117
470	3553976	264
471	3553976	265
472	3606756	415
473	3606756	416
474	3606756	596
475	3640424	376
476	3640424	397
477	3640424	398
478	3659388	182
479	3659388	597
480	3659388	384
481	3661394	598
482	3661394	599
483	3661394	600
484	3682448	216
485	3682448	266
486	3682448	267
487	3731562	354
488	3731562	112
489	3731562	355
490	3741700	270
491	3741700	296
492	3741700	601
493	3778644	602
494	3778644	287
495	3778644	569
496	3783958	190
497	3783958	191
498	3783958	192
499	3896198	359
500	3896198	603
501	3896198	604
502	3899154	605
503	3899154	606
504	3899154	607
505	3908142	608
506	3908142	609
507	3908142	610
508	4016934	611
509	4016934	612
510	4016934	613
511	4034228	173
512	4034228	526
513	4034228	270
514	4046784	539
515	4046784	540
516	4046784	614
517	4062536	615
518	4062536	616
519	4062536	617
520	4116284	618
521	4116284	619
522	4116284	620
523	4154756	114
524	4154756	548
525	4154756	175
526	4154796	114
527	4154796	177
528	4154796	175
529	4169250	621
530	4169250	622
531	4169250	623
532	4178092	378
533	4178092	379
534	4178092	263
535	4196776	182
536	4196776	294
537	4196776	262
538	4218572	280
539	4218572	515
540	4218572	624
541	4281724	156
542	4281724	157
543	4281724	158
544	4348012	625
545	4348012	626
546	4348012	627
547	4425200	243
548	4425200	628
549	4425200	629
550	4437640	630
551	4437640	631
552	4437640	632
553	4437640	633
554	4463894	112
555	4463894	109
556	4463894	634
557	4477536	402
558	4477536	403
559	4477536	404
560	4550098	171
561	4550098	113
562	4550098	635
563	4575576	257
564	4575576	636
565	4575576	637
566	4622512	191
567	4622512	383
568	4622512	638
569	4633694	337
570	4633694	338
571	4633694	183
572	4669788	325
573	4669788	639
574	4669788	640
575	4701182	183
576	4701182	641
577	4701182	642
578	4779682	643
579	4779682	644
580	4779682	645
581	4846340	361
582	4846340	281
583	4846340	362
584	4975722	118
585	4975722	211
586	4975722	212
587	5013056	646
588	5013056	647
589	5013056	266
590	5027774	648
591	5027774	287
592	5027774	598
593	5052448	649
594	5052448	650
595	5052448	651
596	5073642	652
597	5073642	653
598	5073642	654
599	5095030	313
600	5095030	314
601	5095030	315
602	5113040	655
603	5113040	574
604	5113040	126
605	5164214	344
606	5164214	535
607	5164214	143
608	5164432	656
609	5164432	657
610	5164432	658
611	5186714	298
612	5186714	299
613	5186714	300
614	5323662	166
615	5323662	167
616	5323662	168
617	5463162	271
618	5463162	275
619	5463162	276
620	5580390	659
621	5580390	281
622	5580390	635
623	5726616	105
624	5726616	639
625	5726616	660
626	5814060	123
627	5814060	124
628	5814060	125
629	5884052	271
630	5884052	272
631	5884052	273
632	6139732	661
633	6139732	662
634	6139732	663
635	6320628	111
636	6320628	112
637	6320628	113
638	6450804	499
639	6450804	498
640	6450804	664
641	6644200	333
642	6644200	665
643	6644200	666
644	6751668	667
645	6751668	668
646	6751668	669
647	6857112	250
648	6857112	670
649	6857112	671
650	6966692	117
651	6966692	118
652	6966692	119
653	7131622	187
654	7131622	376
655	7131622	203
656	7286456	406
657	7286456	220
658	7286456	672
659	7349662	204
660	7349662	230
661	7349662	231
662	7653254	230
663	7653254	373
664	7653254	673
665	7775622	674
666	7775622	675
667	7775622	676
668	7979580	327
669	7979580	328
670	7979580	329
671	8079248	319
672	8079248	320
673	8079248	321
674	8115900	598
675	8115900	677
676	8115900	678
677	8267604	282
678	8267604	283
679	8267604	284
680	8328716	232
681	8328716	233
682	8328716	234
683	8367814	542
684	8367814	679
685	8367814	680
686	8772262	681
687	8772262	682
688	8772262	683
689	8946378	222
690	8946378	177
691	8946378	545
692	8970448	360
693	8970448	684
694	8970448	685
695	9032400	686
696	9032400	536
697	9032400	339
698	9243804	261
699	9243804	262
700	9243804	263
701	9376612	687
702	9376612	678
703	9376612	688
704	9419884	285
705	9419884	352
706	9419884	186
707	9770150	648
708	9770150	689
709	9770150	690
710	10223460	691
711	10223460	200
712	10223460	692
713	10366206	243
714	10366206	244
715	10366206	245
716	10648342	548
717	10648342	693
718	10648342	202
719	10872600	111
720	10872600	106
721	10872600	285
722	10954984	649
723	10954984	694
724	10954984	695
725	11286314	187
726	11286314	188
727	11286314	189
728	11564570	222
729	11564570	426
730	11564570	696
731	1160419	105
732	1160419	107
733	1160419	106
734	1166100	697
735	1166100	698
736	1166100	699
737	1170358	227
738	1170358	228
739	1170358	229
740	1178665	367
741	1178665	368
742	1178665	369
747	1190080	184
748	1190080	185
749	1190080	186
750	1192628	509
751	1192628	704
752	1192628	705
753	1193138	295
754	1193138	296
755	1193138	297
756	1193631	346
757	1193631	347
758	1193631	348
759	1194173	210
760	1194173	706
761	1194173	426
762	1194263	221
763	1194263	583
764	1194263	707
765	1194606	120
766	1194606	121
767	1194606	122
768	1196134	135
769	1196134	136
770	1196134	137
771	1196948	129
772	1196948	130
773	1196948	131
774	1197624	153
775	1197624	154
776	1197624	155
777	1197628	179
778	1197628	260
779	1197628	225
780	1201607	138
781	1201607	139
782	1201607	140
783	1205489	304
784	1205489	708
785	1205489	709
786	1210166	376
787	1210166	217
788	1210166	316
789	1211837	285
790	1211837	186
791	1211837	163
792	1213641	190
793	1213641	710
794	1213641	711
795	1217209	712
796	1217209	713
797	1217209	369
798	1219827	373
799	1219827	374
800	1219827	375
801	1220634	714
802	1220634	715
803	1220634	716
804	1220719	717
805	1220719	718
806	1220719	719
807	1228705	114
808	1228705	238
809	1228705	115
810	1231587	184
811	1231587	720
812	1231587	721
813	1232829	316
814	1232829	345
815	1232829	722
816	1234721	723
817	1234721	133
818	1234721	176
819	1235166	341
820	1235166	342
821	1235166	343
822	1241317	724
823	1241317	725
824	1241317	726
825	12618926	727
826	12618926	728
827	12618926	729
828	14039582	730
829	14039582	731
830	14039582	732
831	10954600	313
832	10954600	314
833	10954600	370
834	10304142	202
835	10304142	203
836	10304142	204
837	10731256	681
838	10731256	733
839	10731256	172
840	1067106	132
841	1067106	133
842	1067106	134
843	1074638	222
844	1074638	517
845	1074638	211
850	10731768	289
851	10731768	738
852	10731768	739
853	10726604	740
854	10726604	741
855	10726604	742
856	10872600	111
857	10872600	106
858	10872600	285
863	11032374	747
864	11032374	748
865	11032374	749
866	11138512	277
867	11138512	278
868	11138512	279
869	11214590	750
870	11214590	230
871	11214590	219
872	11286314	187
873	11286314	188
874	11286314	189
875	11388406	751
876	11388406	752
877	11388406	753
878	11466222	754
879	11466222	755
880	11466222	756
882	1160419	105
883	1160419	107
884	1160419	106
885	11671006	574
886	11671006	287
887	11671006	758
891	11866324	762
892	11866324	763
893	11866324	764
897	12004038	251
898	12004038	252
899	12004038	253
900	1211837	285
901	1211837	186
902	1211837	163
903	1213641	190
904	1213641	710
905	1213641	711
906	1217209	712
907	1217209	713
908	1217209	369
909	1228705	114
910	1228705	238
911	1228705	115
912	12361974	170
913	12361974	169
914	12361974	512
915	12412888	768
916	12412888	132
917	12412888	769
918	12618926	727
919	12618926	728
920	12618926	729
921	12731980	770
922	12731980	771
923	12731980	772
924	12801262	199
925	12801262	773
926	12801262	774
927	12921446	363
928	12921446	364
929	12921446	365
931	13143964	389
932	13143964	390
933	13143964	216
937	13320622	344
938	13320622	345
939	13320622	138
940	13403046	777
941	13403046	778
942	13403046	779
943	13521006	406
944	13521006	780
945	13521006	781
946	13634480	394
947	13634480	395
948	13634480	396
949	1375666	187
950	1375666	439
951	1375666	440
952	13833688	782
953	13833688	783
954	13833688	784
955	1392170	188
956	1392170	274
957	1392170	196
958	14042066	785
959	14042066	786
960	14042066	787
961	14128670	788
962	14128670	789
963	14128670	790
964	14209916	552
965	14209916	602
966	14209916	791
967	1431045	271
968	1431045	276
969	1431045	522
971	1454029	280
972	1454029	191
973	1454029	281
974	1462764	126
975	1462764	127
976	1462764	128
980	1485796	141
981	1485796	526
982	1485796	400
983	14992922	795
984	14992922	796
985	14992922	797
986	1502407	798
987	1502407	799
988	1502407	800
989	1517268	203
990	1517268	190
991	1517268	801
992	15239678	105
993	15239678	106
994	15239678	107
995	15325794	802
996	15325794	803
997	15325794	804
998	15474916	108
999	15474916	109
1000	15474916	110
1008	15837338	811
1009	15837338	812
1010	15837338	768
1011	1596363	202
1012	1596363	383
1013	1596363	190
1015	1618434	301
1016	1618434	302
1017	1618434	303
1018	1628841	196
1019	1628841	197
1020	1628841	198
1021	1637725	813
1022	1637725	814
1023	1637725	593
1024	16419074	182
1025	16419074	378
1026	16419074	169
1027	1650062	268
1028	1650062	269
1029	1650062	270
1030	1663202	187
1031	1663202	519
1032	1663202	541
1033	1673434	193
1034	1673434	194
1035	1673434	195
1036	1683526	147
1037	1683526	148
1038	1683526	149
1039	1690953	383
1040	1690953	384
1041	1690953	385
1046	1714206	317
1047	1714206	213
1048	1714206	270
1053	1731141	126
1054	1731141	208
1055	1731141	183
1056	1745960	209
1057	1745960	497
1058	1745960	317
1059	1753383	235
1060	1753383	236
1061	1753383	237
1062	17663992	205
1063	17663992	206
1064	17663992	207
1065	1772341	349
1066	1772341	350
1067	1772341	351
1068	1788453	823
1069	1788453	824
1070	1788453	825
1071	1788453	826
1075	1807930	239
1076	1807930	240
1077	1807930	241
1078	1807930	242
1080	1825683	249
1081	1825683	246
1082	1825683	250
1084	1843303	831
1085	1843303	832
1086	1843303	833
1087	1856101	126
1088	1856101	190
1089	1856101	545
1090	1860242	286
1091	1860242	287
1092	1860242	288
1093	1877830	194
1094	1877830	788
1095	1877830	834
1096	1881109	178
1097	1881109	405
1098	1881109	179
1099	1895315	159
1100	1895315	835
1101	1895315	836
1102	1905041	513
1103	1905041	514
1104	1905041	399
1105	1911658	837
1106	1911658	838
1107	1911658	839
1108	1922777	360
1109	1922777	840
1110	1922777	841
\.


--
-- TOC entry 4928 (class 0 OID 16489)
-- Dependencies: 221
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors (id_actor, first_name, second_name, date_birth, date_death, actor_photo, actor_country) FROM stdin;
152	Майкл	Ломенда	\N	\N	\N	\N
111	Том	Холланд	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Tom_Holland_during_pro-am_Wentworth_golf_club_2023-2.jpg/250px-Tom_Holland_during_pro-am_Wentworth_golf_club_2023-2.jpg	\N
177	Крис	Эванс	\N	\N	\N	\N
122	Робин	Лив	1972-02-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Robyn_Lively_-_November_2014_%28cropped%29.jpg/250px-Robyn_Lively_-_November_2014_%28cropped%29.jpg	\N
129	Шая	ЛаБаф	1986-06-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Shia_LaBeouf_2022.jpg/250px-Shia_LaBeouf_2022.jpg	\N
139	Эмма	Уотсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Emma_Watson_2013.jpg/250px-Emma_Watson_2013.jpg	\N
149	Марсия	Харден	1959-08-14	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Marcia_Gay_Harden_2013.jpg/250px-Marcia_Gay_Harden_2013.jpg	\N
159	Бой	Пирс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Crew_members_of_the_movie_%22Genius%22_at_the_Berlinale_party_%2825036107966%29_%28cropped%29.jpg/250px-Crew_members_of_the_movie_%22Genius%22_at_the_Berlinale_party_%2825036107966%29_%28cropped%29.jpg	\N
172	Крис	Пайн	1980-08-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Chris_Pine_%2843043463084%29_%28cropped%29.jpg/250px-Chris_Pine_%2843043463084%29_%28cropped%29.jpg	\N
181	Джефф	Бриджес	1949-12-04	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Jeff_Bridges_by_Gage_Skidmore_4.jpg/250px-Jeff_Bridges_by_Gage_Skidmore_4.jpg	\N
230	Адам	Драйвер	1983-11-19	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Adam_Driver_2023_%28cropped%29.png/250px-Adam_Driver_2023_%28cropped%29.png	\N
266	Марк	Райлэнс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Mark_Rylance_Cannes_2016.jpg/250px-Mark_Rylance_Cannes_2016.jpg	\N
272	Джастис	Смит	1995-08-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Justice_Smith_%2832517668231%29_%28cropped1%29.jpg/250px-Justice_Smith_%2832517668231%29_%28cropped1%29.jpg	\N
290	Эмбер	Хёрд	1986-04-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Amber_Heard_by_Gage_Skidmore.jpg/250px-Amber_Heard_by_Gage_Skidmore.jpg	\N
326	Том	Формер	\N	\N	\N	\N
334	Билл	Пакстон	1955-05-17	2017-02-25	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Bill_Paxton_by_Gage_Skidmore.jpg/250px-Bill_Paxton_by_Gage_Skidmore.jpg	\N
335	Элайджа	Вуд	1981-01-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Elijah_Wood_at_the_2025_Sundance_Film_Festival_%28cropped%292.jpg/250px-Elijah_Wood_at_the_2025_Sundance_Film_Festival_%28cropped%292.jpg	\N
336	Орландо	Блум	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Orlando_Bloom_at_the_2024_Toronto_International_Film_Festival_%28cropped2%29.jpg/250px-Orlando_Bloom_at_the_2024_Toronto_International_Film_Festival_%28cropped2%29.jpg	\N
433	Джоди	Foster	1962-11-19	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Jodie_Foster_portrait_NYFF_2025_02_%28cropped%29.jpg/250px-Jodie_Foster_portrait_NYFF_2025_02_%28cropped%29.jpg	США
440	Эллиот	Пэйдж	1987-02-21	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/2023_National_Book_Festival_%2853122454007%29_%28cropped%29.jpg/250px-2023_National_Book_Festival_%2853122454007%29_%28cropped%29.jpg	США
541	Уилл	Поултер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Will_Poulter_at_the_Toronto_International_Film_Festival_3_%28Cropped%29.jpg/250px-Will_Poulter_at_the_Toronto_International_Film_Festival_3_%28Cropped%29.jpg	\N
555	Розамунда	Пайк	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Rosamund_Pike_at_the_2018_Berlin_Film_Festival_%281%29.jpg/250px-Rosamund_Pike_at_the_2018_Berlin_Film_Festival_%281%29.jpg	\N
595	Рэйчел	Хаус	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Rachel_House_by_Gage_Skidmore.jpg/250px-Rachel_House_by_Gage_Skidmore.jpg	\N
616	Имоджен	Путс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Imogen_Poots_2020.png/250px-Imogen_Poots_2020.png	\N
626	Самара	Уивинг	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Samara_Weaving_on_the_Red_Carpet_for_the_2022_TIFF_Premiere_of_Chevalier_%2852358887281%29.jpg/250px-Samara_Weaving_on_the_Red_Carpet_for_the_2022_TIFF_Premiere_of_Chevalier_%2852358887281%29.jpg	\N
639	Арми	Хаммер	1986-08-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Armie_Hammer_Call_Me_By_Your_Name_Photo_Call_Berlinale_2017_%28cropped%29.jpg/250px-Armie_Hammer_Call_Me_By_Your_Name_Photo_Call_Berlinale_2017_%28cropped%29.jpg	\N
652	Николас	Кейдж	1964-01-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Nicolas_Cage_Comic-Con_2011.jpg/250px-Nicolas_Cage_Comic-Con_2011.jpg	\N
676	Джимми	Чин	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Jimmy_Chin_Spoke_at_University_of_Michigan.jpg/250px-Jimmy_Chin_Spoke_at_University_of_Michigan.jpg	\N
690	Линда	Кэн	\N	\N	\N	\N
700	Рич	Фогель	\N	\N	\N	\N
708	Бии	Ванг	1991-11-04	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Bee_Vang_Headshot_II.jpg/250px-Bee_Vang_Headshot_II.jpg	\N
718	Саймон	Ямс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/151001_%EC%9E%84%EB%8B%AC%ED%99%94_%28cropped%29.jpg/250px-151001_%EC%9E%84%EB%8B%AC%ED%99%94_%28cropped%29.jpg	\N
719	Луи	Фан	\N	\N	\N	\N
722	Айс	Кьюб	1969-06-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Ice_Cube_September_2025.png/250px-Ice_Cube_September_2025.png	\N
202	Кристиан	Бэйл	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Christian_Bale-7837.jpg/250px-Christian_Bale-7837.jpg	США
253	Бёрн	Горман	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Burn_Gorman_2.jpg/250px-Burn_Gorman_2.jpg	США
339	Анджелина	Джоли	1975-06-04	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Angelina_Jolie-643531_%28cropped%29.jpg/250px-Angelina_Jolie-643531_%28cropped%29.jpg	США
229	Ричард	Армитидж	\N	\N	\N	\N
729	Израэль	Элехальде	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/%28Israel_Elejalde%29_Aeterna_Producciones._FITCteando_con_Israel_Elejalde._Agosto_de_2017.jpg/250px-%28Israel_Elejalde%29_Aeterna_Producciones._FITCteando_con_Israel_Elejalde._Agosto_de_2017.jpg	\N
745	Джоу	Рехман	\N	\N	\N	\N
771	Скотт	Хэйз	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Scott_Haze_%28cropped%29.jpg/250px-Scott_Haze_%28cropped%29.jpg	\N
802	Грейс	Кэролайн Карри	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Grace_Caroline_Currey_on_Zero_Dark_Nerdy.jpg/250px-Grace_Caroline_Currey_on_Zero_Dark_Nerdy.jpg	\N
123	Демиан	Бичир	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Demi%C3%A1n_Bichir_at_the_2024_Toronto_International_Film_Festival_%28cropped2%29.jpg/250px-Demi%C3%A1n_Bichir_at_the_2024_Toronto_International_Film_Festival_%28cropped2%29.jpg	Мексика
171	Эми	Адамс	1974-08-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Amy_Adams_UK_Nocturnal_Animals_Premiere_%28cropped%29.jpg/250px-Amy_Adams_UK_Nocturnal_Animals_Premiere_%28cropped%29.jpg	США
179	Сет	Роген	1982-04-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Seth_Rogen_-_Good_Fortune_LA_Premiere.jpg/250px-Seth_Rogen_-_Good_Fortune_LA_Premiere.jpg	Канада
223	Кристоф	Вальц	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Christoph_Waltz_at_82nd_Venice_International_Film_Festival-1.jpg/250px-Christoph_Waltz_at_82nd_Venice_International_Film_Festival-1.jpg	Германия
243	Киану	Ривз	1964-09-02	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg/250px-Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg	Канада
762	Эмбер	Мидхандер	1997-04-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Amber_Midthunder_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg/250px-Amber_Midthunder_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg	США
778	Себастьян	Стэн	1982-08-13	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Sebastian_Stan_in_2024.jpg/250px-Sebastian_Stan_in_2024.jpg	США
780	Патти	Лупоне	1949-04-21	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Patti_LuPone_Agatha_All_Along_Premiere_%28cropped%29.png/250px-Patti_LuPone_Agatha_All_Along_Premiere_%28cropped%29.png	США
782	Брендан	Фрейзер	1968-12-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Brendan_Fraser_October_2022.jpg/250px-Brendan_Fraser_October_2022.jpg	США
789	Байрон	Бауэрс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Byron_Bowers_%2815551372157%29.jpg/250px-Byron_Bowers_%2815551372157%29.jpg	США
790	Рита	Уилсон	1956-10-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Rita_Wilson_by_Gage_Skidmore_2.jpg/250px-Rita_Wilson_by_Gage_Skidmore_2.jpg	США
687	Симу	Лю	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Simu_Liu_by_Gage_Skidmore_2.jpg/250px-Simu_Liu_by_Gage_Skidmore_2.jpg	Канада
688	Тони	Люнг Чиу-вай	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Tony_Leung_as_the_President_of_the_International_Competition_Jury_at_Opening_Ceremony_of_the_Tokyo_International_Film_Festival_2024_%2854578353950%29.jpg/250px-Tony_Leung_as_the_President_of_the_International_Competition_Jury_at_Opening_Ceremony_of_the_Tokyo_International_Film_Festival_2024_%2854578353950%29.jpg	Китай
693	Натали	Портман	1981-06-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Natalie_Portman_2023.jpg/250px-Natalie_Portman_2023.jpg	Израиль
699	Джия	Хан	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Jiah_Khan_at_Stardust_Awards_2013.jpg/250px-Jiah_Khan_at_Stardust_Awards_2013.jpg	США
704	Исла	Фишер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Isla_Fisher_2013.jpg/250px-Isla_Fisher_2013.jpg	Австралия
706	Рэйчел	Вайс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Rachel_Weisz-62940.jpg/250px-Rachel_Weisz-62940.jpg	США
714	Милла	Йовович	1975-12-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Milla_Jovovich_Cannes_2019.jpg/250px-Milla_Jovovich_Cannes_2019.jpg	США
716	Вентворт	Миллер	1972-06-02	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Wentworth_Miller_by_Gage_Skidmore.jpg/250px-Wentworth_Miller_by_Gage_Skidmore.jpg	США
717	Донни	Йена	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Donnie_Yen_20250323.jpg/250px-Donnie_Yen_20250323.jpg	США
723	Джоэл	Киннаман	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Joel_Kinnaman_%2828494159712%29_%28cropped%29.jpg/250px-Joel_Kinnaman_%2828494159712%29_%28cropped%29.jpg	США
271	Райан	Рейнольдс	1976-10-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Deadpool_2_Japan_Premiere_Red_Carpet_Ryan_Reynolds_%28cropped%29.jpg/250px-Deadpool_2_Japan_Premiere_Red_Carpet_Ryan_Reynolds_%28cropped%29.jpg	Канада
276	Морена	Баккарин	1979-06-02	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Morena_Baccarin_in_2016_%2829947145950%29.jpg/250px-Morena_Baccarin_in_2016_%2829947145950%29.jpg	США
278	Николь	Кидман	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Nicole_Kidman-66059_%28cropped%29.jpg/250px-Nicole_Kidman-66059_%28cropped%29.jpg	Автралия
282	Зейн	Аль-Рафиа	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Zain_al-Rafeea_Cannes_2018.jpg/250px-Zain_al-Rafeea_Cannes_2018.jpg	Сирия
292	Коби	Смолдерс	1982-04-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Cobie_Smulders_2019_by_Glenn_Francis_%28cropped2%29.jpg/250px-Cobie_Smulders_2019_by_Glenn_Francis_%28cropped2%29.jpg	Канада
310	Эндрю	Гарфилд	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Andrew_Garfield_82nd_Venice_Film_Festival_%28cropped%29.jpg/250px-Andrew_Garfield_82nd_Venice_Film_Festival_%28cropped%29.jpg	США
311	Сэм	Уортингтон	1976-08-02	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Avatar_The_Way_of_Water_Tokyo_Press_Conference_Sam_Worthington_%2852563252594%29_%28cropped%29.jpg/250px-Avatar_The_Way_of_Water_Tokyo_Press_Conference_Sam_Worthington_%2852563252594%29_%28cropped%29.jpg	Австралия
330	Оскар	Исаак	1979-03-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Oscar_Isaac_at_82nd_Venice_International_Film_Festival-1.jpg/250px-Oscar_Isaac_at_82nd_Venice_International_Film_Festival-1.jpg	Гватемала
333	Эмили	Блант	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Emily_Blunt_SAG_Awards_2019.png/250px-Emily_Blunt_SAG_Awards_2019.png	Великобритания
409	Габриэла	Лопес	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Gaby_Lopez.jpg/250px-Gaby_Lopez.jpg	Мексика
410	Майкл	Дж. Фокс	1961-06-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Michael_J_Fox_2020.jpg/250px-Michael_J_Fox_2020.jpg	Канада
434	Энтони	Хопкинс	1937-12-31	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/AnthonyHopkins10TIFF.jpg/250px-AnthonyHopkins10TIFF.jpg	США
498	Арнольд	Шварценеггер	1947-07-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Arnold_Schwarzenegger_2019_%28cropped%29.jpg/250px-Arnold_Schwarzenegger_2019_%28cropped%29.jpg	Австрия
232	Эми	Мэнсон	\N	\N	\N	\N
500	Мел	Гибсон	1956-01-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Mel_Gibson_Cannes_2016_2.jpg/250px-Mel_Gibson_Cannes_2016_2.jpg	США
502	Патрик	МакГуэн	1928-03-19	2009-01-13	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/McGoohanAllnightlongcrop1.png/250px-McGoohanAllnightlongcrop1.png	Ирландия
504	Кирстен	Данст	1982-04-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Kirsten_Dunst_Cannes_2016.jpg/250px-Kirsten_Dunst_Cannes_2016.jpg	Германия
506	Майк	Майерс	1963-05-25	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Mike_Myers_2017_%2837220071326%29_%28cropped%29.jpg/250px-Mike_Myers_2017_%2837220071326%29_%28cropped%29.jpg	Канада
518	Эмили	Мортимер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Premios_Goya_2018_-_Emily_Mortimer_%28cropped%29_%28cropped%29.jpg/250px-Premios_Goya_2018_-_Emily_Mortimer_%28cropped%29_%28cropped%29.jpg	Великобритания
520	Шарлиз	Терон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Charlize-theron-IMG_6045.jpg/250px-Charlize-theron-IMG_6045.jpg	ЮАР
545	Ана	де Армас	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Ana_de_Armas_%2854462619561%29_%28cropped_2%29.jpg/250px-Ana_de_Armas_%2854462619561%29_%28cropped_2%29.jpg	Куба
547	Дэниел	Брюль	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/MJK_68238_Daniel_Br%C3%BChl_%28Berlinale_2020%29.jpg/250px-MJK_68238_Daniel_Br%C3%BChl_%28Berlinale_2020%29.jpg	Германия
554	Сиенна	Миллер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Sienna_Miller_Premiere_of_The_Lost_City_of_Z_at_Zoo_Palast_Berlinale_2017_04_%28cropped%29.jpg/250px-Sienna_Miller_Premiere_of_The_Lost_City_of_Z_at_Zoo_Palast_Berlinale_2017_04_%28cropped%29.jpg	США
572	Луи	К.К.	1967-09-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Louis_C.K._on_Your_Moms_House_Podcast_2022.png/250px-Louis_C.K._on_Your_Moms_House_Podcast_2022.png	США
578	Идрис	Эльба	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Idris_Elba_A_House_of_Dynamite-21_%28cropped%29.jpg/250px-Idris_Elba_A_House_of_Dynamite-21_%28cropped%29.jpg	Великобритания
586	Джесси	Айзенберг	1983-10-05	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Jesse_Eisenberg_by_Philip_Romano_%283x4_cropped%29.jpg/250px-Jesse_Eisenberg_by_Philip_Romano_%283x4_cropped%29.jpg	США
587	Кэтрин	Уотерстон	1980-03-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Fantastic_Beasts_and_Where_to_Find_Them_Japan_Premiere_Red_Carpet-_Katherine_Waterston_%28461451427%29_%28Cropped%29.jpg/250px-Fantastic_Beasts_and_Where_to_Find_Them_Japan_Premiere_Red_Carpet-_Katherine_Waterston_%28461451427%29_%28Cropped%29.jpg	США
590	Дафне	Увлеченный	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Dafne_Keen_%2848383778052%29_%28cropped%29.jpg/250px-Dafne_Keen_%2848383778052%29_%28cropped%29.jpg	Испания
601	Милли	Бобби Браун	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Millie_Bobby_Brown_-_MBB_-_Portrait_1_-_SFM5_-_July_10%2C_2022_at_Stranger_Fan_Meet_5_People_Convention_%28cropped%29.jpg/250px-Millie_Bobby_Brown_-_MBB_-_Portrait_1_-_SFM5_-_July_10%2C_2022_at_Stranger_Fan_Meet_5_People_Convention_%28cropped%29.jpg	Великобритания
605	Вереск	Мур	\N	\N	https://upload.wikimedia.org/wikipedia/en/thumb/d/d8/Dr._Heather_Moore.jpg/250px-Dr._Heather_Moore.jpg	США
615	Антон	Ельчин	1989-03-11	2016-06-19	https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Anton_Yelchin_2011.jpg/250px-Anton_Yelchin_2011.jpg	США
618	Уилл	Арнетт	1970-05-04	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Will_Arnett_Is_This_Thing_On-11_%28cropped%29.jpg/250px-Will_Arnett_Is_This_Thing_On-11_%28cropped%29.jpg	Канада
670	Уинстон	герцог	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Winston_duke_%2849562238976%29.jpg/250px-Winston_duke_%2849562238976%29.jpg	США
787	Нассар		\N	\N	\N	\N
792	Вирджиния	Кумбс	\N	\N	\N	\N
234	Люк	Аллен-Гейл	\N	\N	\N	\N
239	Герд	Фанк	\N	\N	\N	\N
240	Клаус-Дитер	Клебш	\N	\N	\N	\N
242	Гюнтер	Ринге	\N	\N	\N	\N
245	Джордж	Георгиу	\N	\N	\N	\N
264	Джордж	Маккей	\N	\N	\N	\N
826	Джульетта	Анджели	\N	\N	\N	\N
156	Дженна	Канелл	\N	\N	\N	\N
174	Бен	Взращивать	\N	\N	\N	\N
765	Карл	Урбан	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Karl_Urban_SXSW_2022_%28cropped%29.jpg/250px-Karl_Urban_SXSW_2022_%28cropped%29.jpg	\N
779	Джоджо	Т. Гиббс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/JojoTGibbs.jpg/250px-JojoTGibbs.jpg	США
766	Джек	Куэйд	1992-04-24	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Jack_Quaid_-_Novocaine-Companion.jpg/250px-Jack_Quaid_-_Novocaine-Companion.jpg	\N
767	Антоний	Старр	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Antony_Starr_Photo_Op_GalaxyCon_Oklahoma_City_2024.jpg/250px-Antony_Starr_Photo_Op_GalaxyCon_Oklahoma_City_2024.jpg	\N
768	Джеймс	Марсден	1973-09-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/James_Marsden_by_Gage_Skidmore.jpg/250px-James_Marsden_by_Gage_Skidmore.jpg	\N
770	Тим	Блейк Нельсон	1964-05-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Tim_Blake_Nelson_2016.jpg/250px-Tim_Blake_Nelson_2016.jpg	\N
110	Кайл	Галлнер	1986-10-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Kyle_Gallner_2015.jpg/250px-Kyle_Gallner_2015.jpg	\N
113	Джейк	Джилленхол	1980-12-19	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Jake_Gyllenhaal_2019_by_Glenn_Francis.jpg/250px-Jake_Gyllenhaal_2019_by_Glenn_Francis.jpg	\N
118	Махершала	Али	1974-02-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Mahershala_Ali_by_Gage_Skidmore_%28cropped%29.jpg/250px-Mahershala_Ali_by_Gage_Skidmore_%28cropped%29.jpg	\N
121	Дэйвид	Чокачи	1968-01-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/DavidChokachiOct08.jpg/250px-DavidChokachiOct08.jpg	\N
125	Йонас	Блоке	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Jonas_Bloquet_dej_2017.jpg/250px-Jonas_Bloquet_dej_2017.jpg	\N
135	Тим	Аллен	1953-06-13	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Tim_Allen_2012.jpg/250px-Tim_Allen_2012.jpg	\N
144	Рами	Малек	1981-05-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Rami_Malek_in_2015_%282%29_%28cropped%29.jpg/250px-Rami_Malek_in_2015_%282%29_%28cropped%29.jpg	\N
153	Джерард	Батлер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Gerard_Butler_%2829681162176%29.jpg/250px-Gerard_Butler_%2829681162176%29.jpg	\N
160	Кэрри-Энн	Мох	1967-08-21	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Carrie-Anne_Moss_May_2016.jpg/250px-Carrie-Anne_Moss_May_2016.jpg	\N
162	Джуд	Закон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Jude_Law-7806_%28cropped%29.jpg/250px-Jude_Law-7806_%28cropped%29.jpg	\N
166	Мию	Ирино	1988-02-19	\N	\N	\N
168	Аой	Юки	1992-03-27	\N	\N	\N
176	Майкл	Китон	1951-09-05	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Michael_Keaton-63916_%28cropped%29.jpg/250px-Michael_Keaton-63916_%28cropped%29.jpg	\N
184	Джон	Кьюсак	1966-06-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/John_Cusack_Cannes_2014.jpg/250px-John_Cusack_Cannes_2014.jpg	\N
188	Дженнифер	Лоуренс	1990-08-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Jennifer_Lawrence_in_2016.jpg/250px-Jennifer_Lawrence_in_2016.jpg	\N
192	Розмари	ДеВитт	1971-10-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Rosemarie_DeWitt.jpg/250px-Rosemarie_DeWitt.jpg	\N
196	Лиам	Хемсворт	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Liam_Hemsworth_June_2016.jpg/250px-Liam_Hemsworth_June_2016.jpg	\N
200	Оуэн	Уилсон	1968-11-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Owen_Wilson_Cannes_2011.jpg/250px-Owen_Wilson_Cannes_2011.jpg	\N
201	Изабела	Видович	2001-05-27	\N	\N	\N
204	Джон	Дэвид Вашингтон	1984-07-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/John_David_Washington_in_2024.jpg/250px-John_David_Washington_in_2024.jpg	\N
209	Том	Круиз	1962-07-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Tom_Cruise-2428.jpg/250px-Tom_Cruise-2428.jpg	\N
211	Наоми	Харрис	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Naomie_Harris_2014.jpg/250px-Naomie_Harris_2014.jpg	\N
217	Робин	Райт	1966-04-08	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Robin_Wright_Cannes_2017_%28cropped%29.jpg/250px-Robin_Wright_Cannes_2017_%28cropped%29.jpg	\N
221	Роберт	Дюваль	1931-01-05	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Robert_Duvall_by_David_Shankbone_%28cropped_2%29.jpg/250px-Robert_Duvall_by_David_Shankbone_%28cropped_2%29.jpg	\N
225	Рэй	Лиотта	1954-12-18	2022-05-26	https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Ray_Liotta_Deauville_2014_3.jpg/250px-Ray_Liotta_Deauville_2014_3.jpg	\N
228	Мартин	Фриман	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Martin_Freeman-5341.jpg/250px-Martin_Freeman-5341.jpg	\N
236	Деннис	Куэйд	1954-04-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Dennis_Quaid_by_Gage_Skidmore.jpg/250px-Dennis_Quaid_by_Gage_Skidmore.jpg	\N
248	Тесса	Томпсон	1983-10-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Tessa_Thompson_by_Gage_Skidmore_3.jpg/250px-Tessa_Thompson_by_Gage_Skidmore_3.jpg	\N
252	Карл	Глусман	1988-01-03	\N	\N	\N
261	Дев	Патель	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Dev_Patel_%2829870651654%29.jpg/250px-Dev_Patel_%2829870651654%29.jpg	\N
263	Джоэл	Эджертон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Joel_Edgerton_in_2017.jpg/250px-Joel_Edgerton_in_2017.jpg	\N
360	Итан	Хоук	1970-11-06	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Ethan_Hawke_Blue_Moon-28_%28cropped%29.jpg/250px-Ethan_Hawke_Blue_Moon-28_%28cropped%29.jpg	\N
366	Шон	Бриджерс	1968-03-15	\N	\N	\N
368	Ник	Нольте	1941-02-08	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Nick_Nolte_2008_%282544500287%29.jpg/250px-Nick_Nolte_2008_%282544500287%29.jpg	\N
610	Лора	Уодделл	\N	\N	\N	\N
611	Ким	Мин Хи	\N	\N	\N	\N
132	Джим	Керри	1962-01-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Jim_Carrey_2008.jpg/250px-Jim_Carrey_2008.jpg	Канада
148	Кристина	Хендрикс	1975-05-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Christina_Hendricks_at_PaleyFest_2014.jpg/250px-Christina_Hendricks_at_PaleyFest_2014.jpg	США
170	Генри	Кавилл	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Henry_Cavill_%2848417913146%29_%28cropped%29.jpg/250px-Henry_Cavill_%2848417913146%29_%28cropped%29.jpg	Великобритания
256	Кейко	Цусима	\N	\N	https://upload.wikimedia.org/wikipedia/commons/4/46/Keiko_Tsushima_1.jpg	Япония
355	Бри	Ларсон	1989-10-01	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Captain_Marvel_trailer_at_the_National_Air_and_Space_Museum_4_%28cropped%29.jpg/250px-Captain_Marvel_trailer_at_the_National_Air_and_Space_Museum_4_%28cropped%29.jpg	США
372	Кристофер	Минц-Плассе	1989-06-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Christopher_Mintz-Plasse_by_Gage_Skidmore.jpg/250px-Christopher_Mintz-Plasse_by_Gage_Skidmore.jpg	\N
375	Такеши	Китано	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Takeshi_Kitano_2017.jpg/250px-Takeshi_Kitano_2017.jpg	\N
379	Ребекка	Зал	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Rebecca_Hall_%282024%29_%28cropped%29.jpg/250px-Rebecca_Hall_%282024%29_%28cropped%29.jpg	\N
384	Кристен	Уиг	1973-08-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Kristin_Wiig_2013.jpg/250px-Kristin_Wiig_2013.jpg	\N
386	Эмиль	Хирш	1985-03-13	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Emile_Hirsch_TIFF_2012.jpg/250px-Emile_Hirsch_TIFF_2012.jpg	\N
390	Мария	Бакалова	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Maria_Bakalova_by_Gage_Skidmore.jpg/250px-Maria_Bakalova_by_Gage_Skidmore.jpg	\N
394	Уткарш	Амбудкар	1983-12-08	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/UtkarshAmbudkar.jpg/250px-UtkarshAmbudkar.jpg	\N
401	Александра	Даддарио	1986-03-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Alexandra_Daddario_Eva_Rinaldi_Photography_%281%29_%2834571221352%29.jpg/250px-Alexandra_Daddario_Eva_Rinaldi_Photography_%281%29_%2834571221352%29.jpg	\N
283	Йорданос	Шиферау	\N	\N	\N	\N
284	Болуватифе	Сокровище Банколе	\N	\N	\N	\N
414	Дэйвид	Морс	1953-10-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/David_Morse_%282015%29.jpg/250px-David_Morse_%282015%29.jpg	\N
418	Полетт	Годдард	1910-06-03	1990-04-23	https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Paulette_Goddard_1947.jpg/250px-Paulette_Goddard_1947.jpg	США
420	Филипп	Нуаре	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Noiret-1951-Harcourt.jpg/250px-Noiret-1951-Harcourt.jpg	США
424	Билли	Кристалл	1948-03-14	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Billy_Crystal_by_Gage_Skidmore.jpg/250px-Billy_Crystal_by_Gage_Skidmore.jpg	США
318	Стив	Ланц	\N	\N	\N	\N
363	Лафортюн	Джозеф	\N	\N	\N	\N
365	Гастнер	Лежерм	\N	\N	\N	\N
395	Шон	Кенин	\N	\N	\N	\N
396	Джейк	Зеленый	\N	\N	\N	\N
404	Эрик	Джонсон	\N	\N	\N	\N
408	Мэтью	Зук	\N	\N	\N	\N
425	Мэри	Гиббс	\N	\N	\N	США
269	Эй Джей	Михалка	1991-04-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/AJ_Michalka_-_portrait_2019.jpg/250px-AJ_Michalka_-_portrait_2019.jpg	\N
273	Кэтрин	Ньютон	1997-02-08	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Kathryn_Newton_4DX_2023.jpg/250px-Kathryn_Newton_4DX_2023.jpg	\N
288	Кэти	Бейтс	1948-06-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Kathy_Bates_by_Gage_Skidmore.jpg/250px-Kathy_Bates_by_Gage_Skidmore.jpg	\N
295	Джордж	Клуни	1961-05-06	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/George_Clooney_Jay_Kelly-19_%28cropped%29.jpg/250px-George_Clooney_Jay_Kelly-19_%28cropped%29.jpg	\N
296	Вера	Фармига	1973-08-06	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Vera_Farmiga_%2843676389342%29.jpg/250px-Vera_Farmiga_%2843676389342%29.jpg	\N
301	Адам	Сэндлер	1966-09-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Adam_Sandler_Jay_Kelly-33_%28cropped%29.jpg/250px-Adam_Sandler_Jay_Kelly-33_%28cropped%29.jpg	\N
305	Эли	Валлах	1915-12-07	2014-06-24	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Eli_Wallach_-_publicity.jpg/250px-Eli_Wallach_-_publicity.jpg	\N
309	Льюис	Черный	1948-08-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Lewis_Black_Aviano_2.jpg/250px-Lewis_Black_Aviano_2.jpg	\N
312	Люк	Брейси	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Luke_Bracey_%28cropped%29.jpg/250px-Luke_Bracey_%28cropped%29.jpg	\N
317	Майлз	Теллер	1987-02-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/MilesTellerTIFF2025-01.png/250px-MilesTellerTIFF2025-01.png	\N
324	Эдди	Редмэйн	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Eddie_Redmayne_Smile_2022.jpg/250px-Eddie_Redmayne_Smile_2022.jpg	\N
327	Эбби	Джейкобсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Abbi_Jacobson_at_2015_PaleyFest.jpg/250px-Abbi_Jacobson_at_2015_PaleyFest.jpg	\N
331	Кэри	Маллиган	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Carey_Mulligan_at_the_2025_Sundance_Film_Festival_%28cropped%29.jpg/250px-Carey_Mulligan_at_the_2025_Sundance_Film_Festival_%28cropped%29.jpg	\N
337	Шамейк	Мур	1995-05-04	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Shameik_Moore_Photo_Op_GalaxyCon_Raleigh_2023.jpg/250px-Shameik_Moore_Photo_Op_GalaxyCon_Raleigh_2023.jpg	\N
341	Тахар	Рахим	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Tahar_Rahim_Samba_avp_2014_2.jpg/250px-Tahar_Rahim_Samba_avp_2014_2.jpg	\N
345	Ченнинг	Татум	1980-04-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Channing_Tatum_by_Gage_Skidmore_4.jpg/250px-Channing_Tatum_by_Gage_Skidmore_4.jpg	\N
347	Рик	Маламбри	1982-11-07	\N	\N	\N
350	Джек	Макбрайер	1973-05-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Jackmcbrayer.jpg/250px-Jackmcbrayer.jpg	\N
667	Песня	Кан Хо	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Song_Gangho_2016.jpg/250px-Song_Gangho_2016.jpg	\N
437	Аяно	Сираиси	\N	\N	\N	США
438	Акеми	Ямагучи	\N	\N	\N	США
446	Пол	Фриман	\N	\N	\N	США
526	Мишель	Уильямс	\N	\N	\N	\N
567	Роман	Гриффин Дэвис	\N	\N	\N	\N
580	Мария	Марулл	\N	\N	\N	\N
585	Мэдисон	Вульф	\N	\N	\N	\N
606	Ларс	Нильсен	\N	\N	\N	\N
607	Джей Си	Карлос	\N	\N	\N	\N
608	Саманта	Робинсон	\N	\N	\N	\N
429	Габриэль	Бирн	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Gabriel_Byrne_2010.jpg/250px-Gabriel_Byrne_2010.jpg	США
432	Конни	Нильсен	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Connie_Nielsen_by_Gage_Skidmore.jpg/250px-Connie_Nielsen_by_Gage_Skidmore.jpg	США
435	Скотт	Гленн	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Scott_Glenn_2011_Shankbone.JPG/250px-Scott_Glenn_2011_Shankbone.JPG	США
441	Робин	Уильямс	1951-07-21	2014-08-11	https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Robin_Williams_2011a_%282%29.jpg/250px-Robin_Williams_2011a_%282%29.jpg	США
444	Вера	Майлз	1930-08-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/VERAMiles.jpg/250px-VERAMiles.jpg	США
448	Донна	Рид	1921-01-27	1986-01-14	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Donna_Reed.jpg/250px-Donna_Reed.jpg	США
481	Боб	Гантон	1945-11-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Bob_Gunton%2C_1963_senior_photo.jpg/250px-Bob_Gunton%2C_1963_senior_photo.jpg	\N
486	Генри	Фонда	1905-05-16	1982-08-12	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Henry_Fonda_in_Warlock.jpg/250px-Henry_Fonda_in_Warlock.jpg	\N
493	Ума	Турман	1970-04-29	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/UmaThurman-byPhilipRomano.jpg/250px-UmaThurman-byPhilipRomano.jpg	\N
499	Линда	Гамильтон	1956-09-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Linda_Hamilton_Photo_Op_GalaxyCon_Raleigh_2024.jpg/250px-Linda_Hamilton_Photo_Op_GalaxyCon_Raleigh_2024.jpg	\N
503	Тоби	Магуайр	1975-06-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Tobey_Maguire_2014.jpg/250px-Tobey_Maguire_2014.jpg	\N
507	Эдди	Мерфи	1961-04-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Eddie_Murphy_by_David_Shankbone.jpg/250px-Eddie_Murphy_by_David_Shankbone.jpg	\N
510	Кира	Найтли	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Knightley_Bafta_2015_07.png/250px-Knightley_Bafta_2015_07.png	\N
514	Пол	Уокер	1973-09-12	2013-11-30	https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/PaulWalkerEdit-1.jpg/250px-PaulWalkerEdit-1.jpg	\N
519	Том	Харди	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Tom_Hardy_by_Gage_Skidmore_in_2018.jpg/250px-Tom_Hardy_by_Gage_Skidmore_in_2018.jpg	\N
522	Ти Джей	Миллер	1981-06-04	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/T._J._Miller_by_Gage_Skidmore_2.jpg/250px-T._J._Miller_by_Gage_Skidmore_2.jpg	\N
528	Элизабет	Банки	1974-02-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Elizabeth_Banks_during_interview_in_2019.png/250px-Elizabeth_Banks_during_interview_in_2019.png	\N
532	Дэйвид	Тьюлис	1963-03-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/David_Thewlis_2008.jpg/250px-David_Thewlis_2008.jpg	\N
536	Ричард	Мэдден	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Richard_Madden_%2848462874707%29_%28cropped%29.jpg/250px-Richard_Madden_%2848462874707%29_%28cropped%29.jpg	\N
540	Кая	Скоделарио	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Kaya_Scodelario_2018.png/250px-Kaya_Scodelario_2018.png	\N
544	Брайс	Даллас Ховард	1981-03-02	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Bryce_Dallas_Howard_-_Los_Angeles_Comic_Con_2025.jpg/250px-Bryce_Dallas_Howard_-_Los_Angeles_Comic_Con_2025.jpg	\N
548	Крис	Хемсворт	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Chris_Hemsworth_by_Gage_Skidmore_3.jpg/250px-Chris_Hemsworth_by_Gage_Skidmore_3.jpg	\N
552	Кери	Рассел	1976-03-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Keri_Russell_%2813948636905%29_%28cropped%29.jpg/250px-Keri_Russell_%2813948636905%29_%28cropped%29.jpg	\N
558	Салим	Кешиуш	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Salim_Kechiouche_at_the_2025_Locarno_Film_Festival_02.jpg/250px-Salim_Kechiouche_at_the_2025_Locarno_Film_Festival_02.jpg	\N
561	Алек	Болдуин	1958-04-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Alec_Baldwin_2018.jpg/250px-Alec_Baldwin_2018.jpg	\N
565	Дейзи	Ридли	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Daisy_Ridley_Our_Movie_Guide_2024.png/250px-Daisy_Ridley_Our_Movie_Guide_2024.png	\N
570	Сэм	Клафлин	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Sam_Claflin_2014.jpg/250px-Sam_Claflin_2014.jpg	\N
574	Кевин	Харт	1979-07-06	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Kevin_Hart_2014_%28cropped_2%29.jpg/250px-Kevin_Hart_2014_%28cropped_2%29.jpg	\N
579	Дарио	Грандинетти	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Festival_de_M%C3%A1laga_2024_-_Dar%C3%ADo_Grandinetti.jpg/250px-Festival_de_M%C3%A1laga_2024_-_Dar%C3%ADo_Grandinetti.jpg	\N
588	Элисон	Судол	1984-12-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Alison_Sudol_by_Gage_Skidmore_%282%29.jpg/250px-Alison_Sudol_by_Gage_Skidmore_%282%29.jpg	\N
594	Аулии	Кравальо	2000-11-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Auli%27i_Cravalho_KCA_2025.png/250px-Auli%27i_Cravalho_KCA_2025.png	\N
598	Сэм	Роквелл	1968-11-05	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Sam_Rockwell_by_Gage_Skidmore.jpg/250px-Sam_Rockwell_by_Gage_Skidmore.jpg	\N
604	Дэйв	Баутиста	1969-01-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Dave_Bautista_Photo_Op_GalaxyCon_Minneapolis_2019.jpg/250px-Dave_Bautista_Photo_Op_GalaxyCon_Minneapolis_2019.jpg	\N
673	Юлия	Грир	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Julia_Greer.jpg/250px-Julia_Greer.jpg	\N
677	Марк	Марон	1963-09-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Marc_Maron_by_Gage_Skidmore.jpg/250px-Marc_Maron_by_Gage_Skidmore.jpg	\N
682	Джек	Рейнор	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Jack_Reynor_DIFF_2016.jpg/250px-Jack_Reynor_DIFF_2016.jpg	\N
824	Шеваун	Кастль	\N	\N	\N	\N
825	Рэндал	Мэлоун	\N	\N	\N	\N
490	Ральф	Файнс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Ralph_Fiennes_2024.jpg/250px-Ralph_Fiennes_2024.jpg	США
692	Малума		\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/2023-11-16_Gala_de_los_Latin_Grammy%2C_20_%28Maluma%29.jpg/250px-2023-11-16_Gala_de_los_Latin_Grammy%2C_20_%28Maluma%29.jpg	\N
695	Брэндон	Перея	1995-05-25	\N	\N	\N
698	Асин		\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Asin05.jpg/250px-Asin05.jpg	\N
703	Майкл	Услан	1951-06-02	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Michael_E._Uslan_2012.jpg/250px-Michael_E._Uslan_2012.jpg	\N
709	Кристофер	Карли	1978-05-31	\N	\N	\N
712	Келли	Макдональд	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Kelly_Macdonald_at_Brave_premiere_%28cropped%29.jpg/250px-Kelly_Macdonald_at_Brave_premiere_%28cropped%29.jpg	\N
715	Али	Лартер	1976-02-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Ali_Larter.jpg/250px-Ali_Larter.jpg	\N
727	Пенелопа	Круз	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Goyas_2024_-_Pen%C3%A9lope_Cruz-2_%28cropped%29.jpg/250px-Goyas_2024_-_Pen%C3%A9lope_Cruz-2_%28cropped%29.jpg	\N
736	Ян	Хендри	\N	\N	https://upload.wikimedia.org/wikipedia/en/thumb/6/68/Ian_Hendry_Actor_Live_Now_Pay_Later_1962.jpg/250px-Ian_Hendry_Actor_Live_Now_Pay_Later_1962.jpg	\N
637	Бронте	Кармайкл	\N	\N	\N	\N
741	Ким	Сан Чжун	1965-08-06	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Kim_Sang-jong_in_2017.jpg/250px-Kim_Sang-jong_in_2017.jpg	\N
748	Акари	Кито	1994-10-16	\N	\N	\N
751	Элисон	Бри	1982-12-29	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Alison_Brie_at_the_2025_Sundance_Film_Festival_02_%28cropped%29.jpg/250px-Alison_Brie_at_the_2025_Sundance_Film_Festival_02_%28cropped%29.jpg	\N
769	Бен	Шварц	1981-09-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Ben_Schwartz_Photo_Op_GalaxyCon_Raleigh_2025.jpg/250px-Ben_Schwartz_Photo_Op_GalaxyCon_Raleigh_2025.jpg	\N
772	Гэвин	Льюис	2003-10-27	\N	\N	\N
776	Дэниел	Ингс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Daniel_Ings_2024.jpg/250px-Daniel_Ings_2024.jpg	\N
656	Ник	Робинсон	\N	\N	\N	\N
683	Вильгельм	Бломгрен	\N	\N	\N	\N
701	Алан	Кистлер	\N	\N	\N	\N
702	Грегори	Новек	\N	\N	\N	\N
721	Крейг	Робинсон	\N	\N	\N	\N
730	Хидетоши	Нисидзима	\N	\N	\N	\N
734	Рио	Фаннинг	\N	\N	\N	\N
735	Джек	Хедли	\N	\N	\N	\N
737	Розмари	Макхейл	\N	\N	\N	\N
743	Гаурав	Диксит	\N	\N	\N	\N
744	Маниш	дев Джа	\N	\N	\N	\N
746	Имтияз	Шейх	\N	\N	\N	\N
753	Голденит		\N	\N	\N	\N
758	Жасмин	Мэтьюз	\N	\N	\N	\N
759	Арлин	Алькала	\N	\N	\N	\N
760	Камилла	Габбриелли	\N	\N	\N	\N
761	Кэтлин	Свенсон	\N	\N	\N	\N
774	Эмма	Берман	\N	\N	\N	\N
620	Росарио	Доусон	1979-05-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Rosario_Dawson_by_Gage_Skidmore_3.jpg/250px-Rosario_Dawson_by_Gage_Skidmore_3.jpg	\N
628	Риккардо	Скамарчо	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Riccardo_Scamarcio.jpg/250px-Riccardo_Scamarcio.jpg	\N
632	Воля	Фридле	1976-08-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Will_Friedle_by_Gage_Skidmore.jpg/250px-Will_Friedle_by_Gage_Skidmore.jpg	\N
640	Джастин	Теру	1971-08-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Justin_Theroux-63738.jpg/250px-Justin_Theroux-63738.jpg	\N
643	Джейсон	Стэтхэм	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Jason_Statham_2018.jpg/250px-Jason_Statham_2018.jpg	\N
648	Фрэнсис	МакДорманд	1957-06-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Frances_McDormand_2015_%28cropped%29.jpg/250px-Frances_McDormand_2015_%28cropped%29.jpg	\N
654	Мадлен	Артур	1997-03-10	\N	\N	\N
658	Джош	Дюамель	1972-11-14	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Josh_Duhamel_SXSW_2017_%28cropped%29.jpg/250px-Josh_Duhamel_SXSW_2017_%28cropped%29.jpg	\N
663	Наоми	Скотт	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Naomi_Scott_in_2024_02.jpg/250px-Naomi_Scott_in_2024_02.jpg	\N
665	Джон	Красинский	1979-10-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/John_Krasinski_2022.jpg/250px-John_Krasinski_2022.jpg	\N
794	Винсент	Моралес	\N	\N	\N	\N
795	Сесилия	Фьелльхой	\N	\N	\N	\N
796	Саймон	Леваев	\N	\N	\N	\N
797	Пернилла	Сьёхольм	\N	\N	\N	\N
811	Дэн	Дюран	\N	\N	\N	\N
815	Филип	Баче	\N	\N	\N	\N
816	Мишель	Экзархос	\N	\N	\N	\N
817	Майкл	Харт	\N	\N	\N	\N
818	Ариэль	Лазарь	\N	\N	\N	\N
821	Уильям	Вон	\N	\N	\N	\N
822	Ананд	Раджарам	\N	\N	\N	\N
823	Теренс	Лординг	\N	\N	\N	\N
763	Дакота	Биверс	\N	\N	\N	\N
627	Стивен	Бренд	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Steven_brand_2022_%28cropped%29.jpg/250px-Steven_brand_2022_%28cropped%29.jpg	Великобритания
793	Эрик	Лэйк	\N	\N	\N	\N
731	Токо	Миура	\N	\N	\N	Япония
732	Рейка	Киришима	\N	\N	\N	Япония
764	Датч	ДиЛиегро	1988-08-06	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Dane_DiLiegro_at_the_premiere_of_Prey_%282022%29_%28cropped%29.jpg/250px-Dane_DiLiegro_at_the_premiere_of_Prey_%282022%29_%28cropped%29.jpg	США
775	Мукул	Наг	\N	\N	\N	Индия
636	Хейли	Этвелл	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Hayley_Atwell-2771.jpg/250px-Hayley_Atwell-2771.jpg	США
830	Роберт	Лоуренсон	\N	\N	\N	\N
831	Грегори	Джеймс Коэн	\N	\N	\N	\N
832	Джордж	Шюнцер	\N	\N	\N	\N
837	Том	МакГрат	\N	\N	\N	\N
838	Крис	Миллер	\N	\N	\N	\N
106	Зендая		1996-09-01	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Zendaya_-_2019_by_Glenn_Francis.jpg/250px-Zendaya_-_2019_by_Glenn_Francis.jpg	\N
107	Ребекка	Фергюсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Rebecca_Ferguson_at_82nd_Venice_International_Film_Festival-1_%28cropped%29_%28cropped%29.jpg/250px-Rebecca_Ferguson_at_82nd_Venice_International_Film_Festival-1_%28cropped%29_%28cropped%29.jpg	\N
108	Сози	Бекон	1992-03-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Scoot_McNairy%27s_partner_at_the_2024_Toronto_International_Film_Festival._01.jpg/960px-Scoot_McNairy%27s_partner_at_the_2024_Toronto_International_Film_Festival._01.jpg	\N
109	Джесси	Т. Ашер	1992-02-29	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Jessie_Usher_%2851958530351%29_%28cropped%29_%28cropped%29_%28cropped%29.jpg/250px-Jessie_Usher_%2851958530351%29_%28cropped%29_%28cropped%29_%28cropped%29.jpg	\N
114	Роберт	Дауни младший.	1965-04-04	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Robert_Downey_Jr._2014_Comic-Con.jpg/250px-Robert_Downey_Jr._2014_Comic-Con.jpg	\N
115	Гвинет	Пэлтроу	1972-09-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/GwynethPaltrowByAndreaRaffin2011.jpg/250px-GwynethPaltrowByAndreaRaffin2011.jpg	\N
116	Терренс	Ховард	1969-03-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Terrence_Howard_-_Monte-Carlo.jpg/250px-Terrence_Howard_-_Monte-Carlo.jpg	\N
119	Линда	Карделлини	1975-06-25	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/South_by_Southwest_2019_7_%2832449999697%29_%28cropped%29.jpg/250px-South_by_Southwest_2019_7_%2832449999697%29_%28cropped%29.jpg	\N
120	Александра	Пол	1963-07-29	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Alexandra_Paul_Photo.jpg/250px-Alexandra_Paul_Photo.jpg	\N
124	Таисса	Фармига	1994-08-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Taissa_Farmiga_%282016%29_%28cropped%29.jpg/250px-Taissa_Farmiga_%282016%29_%28cropped%29.jpg	\N
126	Харрисон	Форд	1942-07-13	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Harrison_Ford_-_Televerse_2025_%28cropped%29.jpg/250px-Harrison_Ford_-_Televerse_2025_%28cropped%29.jpg	\N
127	Фиби	Уоллер-Бридж	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Nicola_Benedetti_Humza_Yousaf_Phoebe_Waller-Bridge_-_All_Festivals_Reception_%28Waller-Bridge_cropped%29_%28cropped%29.jpg/250px-Nicola_Benedetti_Humza_Yousaf_Phoebe_Waller-Bridge_-_All_Festivals_Reception_%28Waller-Bridge_cropped%29_%28cropped%29.jpg	\N
128	Антонио	Бандерас	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Goyas_2025_-_Antonio_Banderas_%28cropped%29.jpg/250px-Goyas_2025_-_Antonio_Banderas_%28cropped%29.jpg	\N
130	Эван	Рэйчел Вуд	1987-09-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Evan_Rachel_Wood_%283x4_cropped%29.jpg/250px-Evan_Rachel_Wood_%283x4_cropped%29.jpg	\N
237	Пегги	Липтон	1946-08-30	2019-05-11	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Peggy_Lipton_Mod_Squad.JPG/250px-Peggy_Lipton_Mod_Squad.JPG	\N
781	Эми	Райан	1968-05-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Amy_Ryan-60157.jpg/250px-Amy_Ryan-60157.jpg	\N
784	Тай	Симпкинс	2001-08-06	\N	\N	\N
786	Павайл	Гулати	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Pavail_Gulati_at_Deva_launch_%28cropped%29.jpg/250px-Pavail_Gulati_at_Deva_launch_%28cropped%29.jpg	\N
798	Джейми	Ли Кертис	1958-11-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/2025_Jamie_Lee_Curtis_%28cropped%29.jpg/250px-2025_Jamie_Lee_Curtis_%28cropped%29.jpg	\N
800	Энди	Матичак	1994-06-07	\N	\N	\N
803	Вирджиния	Гарднер	1995-04-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Virginia_Gardner_2018.jpg/250px-Virginia_Gardner_2018.jpg	\N
804	Мейсон	Гудинг	1996-11-14	\N	\N	\N
808	Ханна	Хедлунд	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Hanna_Hedlund_-1.jpg/250px-Hanna_Hedlund_-1.jpg	\N
812	Кристен	Белл	1980-07-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Kristen_Bell_at_Televerse_2025.jpg/250px-Kristen_Bell_at_Televerse_2025.jpg	\N
820	Шивон	Мерфи	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Siobhan_Murphy_2009.png/250px-Siobhan_Murphy_2009.png	\N
829	Дамиан	Льюис	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Damian_Lewis_Berlin_2015.jpg/250px-Damian_Lewis_Berlin_2015.jpg	\N
836	Эмилия	Джонс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Emilia_jones_2022_1.jpg/250px-Emilia_jones_2022_1.jpg	\N
841	Джеймс	Рэнсоне	1979-06-02	\N	\N	\N
131	Мадс	Миккельсен	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Mads_Mikkelsen_at_82nd_Venice_International_Film_Festival_%28cropped2%29.jpg/250px-Mads_Mikkelsen_at_82nd_Venice_International_Film_Festival_%28cropped2%29.jpg	\N
133	Гэри	Олдман	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Gary_Oldman_%2813925515511%29_%28cropped%29.jpg/250px-Gary_Oldman_%2813925515511%29_%28cropped%29.jpg	\N
839	Кристофер	Найтс	\N	\N	\N	\N
105	Тимоти	Шаламе	1995-12-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Timoth%C3%A9e_Chalamet-63482_%28cropped%29.jpg/250px-Timoth%C3%A9e_Chalamet-63482_%28cropped%29.jpg	США
112	Самуэль	Л. Джексон	1948-12-21	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/SamuelLJackson.jpg/250px-SamuelLJackson.jpg	США
117	Вигго	Мортенсен	1958-10-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Viggo_Mortensen_B_%282020%29.jpg/250px-Viggo_Mortensen_B_%282020%29.jpg	США
136	Сигурни	Ткач	1949-10-08	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Sigourney_Weaver_at_the_2025_Toronto_International_Film_Festival_%28cropped%29.jpg/250px-Sigourney_Weaver_at_the_2025_Toronto_International_Film_Festival_%28cropped%29.jpg	\N
137	Жанна	Трипплхорн	1963-06-10	\N	https://upload.wikimedia.org/wikipedia/commons/c/c1/Jeanne_Tripplehorn_1992.jpg	\N
138	Дэниел	Рэдклифф	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/DanielRadcliffe.jpg/250px-DanielRadcliffe.jpg	\N
140	Руперт	Гринт	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/RupertGrint2018.jpg/250px-RupertGrint2018.jpg	\N
142	Рассел	Кроу	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Russell_Crowe_on_the_Green_Carpet_at_the_2025_Zurich_Film_Festival_06_%28cropped%29.jpg/250px-Russell_Crowe_on_the_Green_Carpet_at_the_2025_Zurich_Film_Festival_06_%28cropped%29.jpg	\N
143	Энн	Хэтэуэй	1982-11-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Anne_Hathaway_at_The_Apprentice_in_NYC_03_%28cropped2%29.jpg/250px-Anne_Hathaway_at_The_Apprentice_in_NYC_03_%28cropped2%29.jpg	\N
146	Гвилим	Ли	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Gwilym_Lee_on_MTV_Movies.jpg/250px-Gwilym_Lee_on_MTV_Movies.jpg	\N
147	Адриан	Броды	1973-04-14	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Adrien_Brody_Is_This_Thing_On-89_%28cropped%29.jpg/250px-Adrien_Brody_Is_This_Thing_On-89_%28cropped%29.jpg	\N
150	Джон	Ллойд Янг	1975-07-04	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/John_lloyd_young_actor_by_bill_cramer.jpg/250px-John_lloyd_young_actor_by_bill_cramer.jpg	\N
151	Эрих	Берген	1985-12-31	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Erich_bergen_2023_2.jpg/250px-Erich_bergen_2023_2.jpg	\N
154	Джейми	Фокс	1967-12-13	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/TIFF_2019_jamie_foxx_%28cropped%29.jpg/250px-TIFF_2019_jamie_foxx_%28cropped%29.jpg	\N
155	Лесли	Бибб	1973-11-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Leslie_Bibb_2011_Shankbone.JPG/250px-Leslie_Bibb_2011_Shankbone.JPG	\N
157	Саманта	Скаффиди	1989-03-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Samantha_Scaffidi_Photo_Op_Nightmare_Weekend_Cleveland_2025.jpg/250px-Samantha_Scaffidi_Photo_Op_Nightmare_Weekend_Cleveland_2025.jpg	\N
158	Дэйвид	Говард Торнтон	1979-11-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/David_Howard_Thornton_by_Gage_Skidmore.jpg/250px-David_Howard_Thornton_by_Gage_Skidmore.jpg	\N
161	Джо	Пантолиано	1951-09-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/JoePantolianoFeb2009_%28cropped%29.jpg/250px-JoePantolianoFeb2009_%28cropped%29.jpg	\N
163	Рэйчел	Макадамс	1978-11-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Rachel_McAdams_2016.jpg/250px-Rachel_McAdams_2016.jpg	\N
164	Отметка	Хэмилл	1951-09-25	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Mark_Hamill_by_Gage_Skidmore_4.jpg/250px-Mark_Hamill_by_Gage_Skidmore_4.jpg	\N
165	Кэрри	Фишер	1956-10-21	2016-12-27	https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Carrie_Fisher_2013-a_straightened.jpg/250px-Carrie_Fisher_2013-a_straightened.jpg	\N
167	Саори	Хаями	1991-05-29	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Hayami_Saori_from_%22Komada_-A_Whisky_Family-%22_at_Red_Carpet_of_the_Tokyo_International_Film_Festival_2023_%2853348308348%29_%28cropped%29.jpg/250px-Hayami_Saori_from_%22Komada_-A_Whisky_Family-%22_at_Red_Carpet_of_the_Tokyo_International_Film_Festival_2023_%2853348308348%29_%28cropped%29.jpg	\N
169	Бен	Аффлек	1972-08-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Ben_Affleck_on_the_Red_Carpet%2C_SXSW_2023_%28cropped%29.jpg/250px-Ben_Affleck_on_the_Red_Carpet%2C_SXSW_2023_%28cropped%29.jpg	\N
173	Кейси	Аффлек	1975-08-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Casey_Affleck_at_the_Manchester_by_the_Sea_premiere_%2830199719155%29_%28cropped%29.jpg/250px-Casey_Affleck_at_the_Manchester_by_the_Sea_premiere_%2830199719155%29_%28cropped%29.jpg	\N
175	Отметка	Руффало	1967-11-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Mark_Ruffalo_%2836201774756%29_%28cropped%29.jpg/250px-Mark_Ruffalo_%2836201774756%29_%28cropped%29.jpg	\N
178	Джеймс	Франко	1978-04-19	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/James_Franco_4%2C_2013.jpg/250px-James_Franco_4%2C_2013.jpg	\N
180	Рэндалл	Парк	1974-03-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Randall_Park%2C_cropped%2C_New_York_City_%28October_2016%29_%2829977100934%29.jpg/250px-Randall_Park%2C_cropped%2C_New_York_City_%28October_2016%29_%2829977100934%29.jpg	\N
182	Мэтт	Дэймон	1970-10-08	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/MKr347638_Matt_Damon_%28Small_Things_Like_These%2C_Berlinale_2024%29_%283x4_cropped%29.jpg/250px-MKr347638_Matt_Damon_%28Small_Things_Like_These%2C_Berlinale_2024%29_%283x4_cropped%29.jpg	\N
183	Хейли	Стейнфельд	1996-12-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Hailee_Steinfeld_by_Gage_Skidmore.jpg/250px-Hailee_Steinfeld_by_Gage_Skidmore.jpg	\N
134	Колин	Ферт	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Colin_Firth_%2836124162705%29_%28cropped%29.jpg/250px-Colin_Firth_%2836124162705%29_%28cropped%29.jpg	Великобритания
141	Хью	Джекман	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Hugh_Jackman_Is_This_Thing_On-68_%28cropped%29.jpg/250px-Hugh_Jackman_Is_This_Thing_On-68_%28cropped%29.jpg	Австралия
145	Люси	Бойнтон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Lucy_Boynton_2022_TIFF_Premiere_of_Chevalier_%2852359198539%29_%28cropped%29.jpg/250px-Lucy_Boynton_2022_TIFF_Premiere_of_Chevalier_%2852359198539%29_%28cropped%29.jpg	США
185	Тандиве	Ньютон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Thandiwe_Newton_Peabody_Awards%2C_June_2021.png/250px-Thandiwe_Newton_Peabody_Awards%2C_June_2021.png	\N
186	Чиветел	Эджиофор	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Chiwetel_Ejiofor_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg/250px-Chiwetel_Ejiofor_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg	\N
187	Леонардо	Ди Каприо	1974-11-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Leonardo_Dicaprio_-_World_Premiere_%E2%80%98One_Battle_after_Another%E2%80%99.jpg/250px-Leonardo_Dicaprio_-_World_Premiere_%E2%80%98One_Battle_after_Another%E2%80%99.jpg	\N
189	Мерил	Стрип	1949-06-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Meryl_Streep_interview_at_Festival_de_Cannes_2024_%28cropped_2%29.jpg/250px-Meryl_Streep_interview_at_Festival_de_Cannes_2024_%28cropped_2%29.jpg	\N
190	Райан	Гослинг	1980-11-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/GoslingBFI081223_%2822_of_30%29_%2853388157347%29_%28cropped%29.jpg/250px-GoslingBFI081223_%2822_of_30%29_%2853388157347%29_%28cropped%29.jpg	\N
191	Эмма	Камень	1988-11-06	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Emma_Stone_at_the_2025_Cannes_Film_Festival_03_%28cropped%29.jpg/250px-Emma_Stone_at_the_2025_Cannes_Film_Festival_03_%28cropped%29.jpg	\N
193	Кристен	Стюарт	1990-04-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Kristen_Stewart_at_Berlinale_2024_cropped_1.tif/lossy-page1-250px-Kristen_Stewart_at_Berlinale_2024_cropped_1.tif.jpg	\N
194	Роберт	Паттинсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Robert_Pattinson_at_Berlinale_2025.jpg/250px-Robert_Pattinson_at_Berlinale_2025.jpg	\N
195	Тейлор	Лотнер	1992-02-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Taylor_Lautner_Comic-Con_2012.jpg/250px-Taylor_Lautner_Comic-Con_2012.jpg	\N
197	Джефф	Голдблюм	1952-10-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Jeff_Goldblum_by_Gage_Skidmore_3.jpg/250px-Jeff_Goldblum_by_Gage_Skidmore_3.jpg	\N
198	Счет	Пуллман	1953-12-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Bill_Pullman_in_NYC_%2815106083834%29_%28cropped%29.jpg/250px-Bill_Pullman_in_NYC_%2815106083834%29_%28cropped%29.jpg	\N
199	Джейкоб	Трамбле	2006-10-05	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Jacob_Tremblay_by_Gage_Skidmore.jpg/250px-Jacob_Tremblay_by_Gage_Skidmore.jpg	\N
203	Марго	Робби	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/SYDNEY%2C_AUSTRALIA_-_JANUARY_23_Margot_Robbie_arrives_at_the_Australian_Premiere_of_%27I%2C_Tonya%27_on_January_23%2C_2018_in_Sydney%2C_Australia_%2828074883999%29_%28cropped_2%29.jpg/250px-thumbnail.jpg	\N
205	Кортни	Кокс	1964-06-15	\N	https://upload.wikimedia.org/wikipedia/commons/0/0f/CourteneyCoxFeb09.jpg	\N
206	Мелисса	Баррера	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Melissa_Barrera_in_2023.png/250px-Melissa_Barrera_in_2023.png	\N
207	Дженна	Ортега	2002-09-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Jenna_Ortega-63792_%28cropped%29.jpg/250px-Jenna_Ortega-63792_%28cropped%29.jpg	\N
208	Аса	Баттерфилд	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Asa_Butterfield_in_2019_%28cropped%29.jpg/250px-Asa_Butterfield_in_2019_%28cropped%29.jpg	\N
210	Джереми	Реннер	1971-01-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Jeremy_Renner_at_TIFF_2025_%28cropped%29.jpg/250px-Jeremy_Renner_at_TIFF_2025_%28cropped%29.jpg	\N
212	Треванте	Родос	1990-02-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Trevante_Rhodes_%2832303509424%29.jpg/250px-Trevante_Rhodes_%2832303509424%29.jpg	\N
213	Шейлин	Вудли	1991-11-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Shailene_Woodley_%E1%BA%A5t_the_82nd_Venice_Film_Festival_%28cropped%29.jpg/250px-Shailene_Woodley_%E1%BA%A5t_the_82nd_Venice_Film_Festival_%28cropped%29.jpg	\N
214	Тео	Джеймс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Theo_James_Divergent_premiere.jpg/250px-Theo_James_Divergent_premiere.jpg	\N
215	Кейт	Уинслет	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Kate_Winslet_2024_The_Regime_premiere_01_%28cropped2%29.png/250px-Kate_Winslet_2024_The_Regime_premiere_01_%28cropped2%29.png	\N
218	Гэри	Синизе	1955-03-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Gary_Sinise_2011_%28cropped%29.jpg/250px-Gary_Sinise_2011_%28cropped%29.jpg	\N
219	Ал	Пачино	1940-04-25	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Al_Pacino_2016_%2830401544240%29.jpg/250px-Al_Pacino_2016_%2830401544240%29.jpg	\N
224	Леа	Сейду	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/L%C3%A9a_Seydoux_Cannes_2016.jpg/250px-L%C3%A9a_Seydoux_Cannes_2016.jpg	\N
226	Джо	Пеши	1943-02-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/JoePesci-2009.jpg/250px-JoePesci-2009.jpg	\N
227	Ян	Маккеллен	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/SDCC13_-_Ian_McKellen.jpg/250px-SDCC13_-_Ian_McKellen.jpg	\N
231	Лора	Лунь	1990-03-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Laura_Harrier_Cannes_2018_2.jpg/250px-Laura_Harrier_Cannes_2018_2.jpg	\N
233	Доминик	Мафхам	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Dominic_Mafham_February_2016.jpg/250px-Dominic_Mafham_February_2016.jpg	\N
216	Том	Хэнкс	1956-07-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/TomHanksPrincEdw031223_%2811_of_41%29_%28cropped%29.jpg/250px-TomHanksPrincEdw031223_%2811_of_41%29_%28cropped%29.jpg	США
220	Роберт	Де Ниро	1943-08-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Robert_de_Niro_Cannes_Film_Festival_%283x4_cropped%29.jpg/250px-Robert_de_Niro_Cannes_Film_Festival_%283x4_cropped%29.jpg	США
222	Дэниел	Крейг	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Daniel_Craig_TIFF_2025_Red_Carpet_%28cropped%29.jpg/250px-Daniel_Craig_TIFF_2025_Red_Carpet_%28cropped%29.jpg	Великобритания
235	Джош	Гад	1981-02-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/41st_Annie_Awards%2C_Josh_Gad_%28crop%29.jpg/250px-41st_Annie_Awards%2C_Josh_Gad_%28crop%29.jpg	\N
238	Микки	Рурк	1952-09-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Mickey_Rourke_10_December_2010_%28cropped%29.jpeg/250px-Mickey_Rourke_10_December_2010_%28cropped%29.jpeg	\N
244	Лоуренс	Фишберн	1961-07-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/National_Memorial_Day_Concert_2017_%2834117818524%29_%28cropped%29.jpg/250px-National_Memorial_Day_Concert_2017_%2834117818524%29_%28cropped%29.jpg	\N
246	Майкл	Б. Джордан	1987-02-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/2018-05-12-_Cannes-L%27acteur_Michael_B._Jordan-2721_%2842075892224%29.jpg/250px-2018-05-12-_Cannes-L%27acteur_Michael_B._Jordan-2721_%2842075892224%29.jpg	\N
247	Сильвестр	Сталлоне	1946-07-06	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Sylvester_Stallone_Cannes_2019.jpg/250px-Sylvester_Stallone_Cannes_2019.jpg	\N
249	Чедвик	Боузман	1976-11-29	2020-08-28	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chadwick_Boseman_by_Gage_Skidmore_July_2017_%28cropped%29.jpg/250px-Chadwick_Boseman_by_Gage_Skidmore_July_2017_%28cropped%29.jpg	\N
251	Майка	Монро	1993-05-29	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Maika_Monroe_June_2016.jpg/250px-Maika_Monroe_June_2016.jpg	\N
254	Тосиро	Мифунэ	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Toshiro_Mifune_1954_Scan10003_160913.jpg/250px-Toshiro_Mifune_1954_Scan10003_160913.jpg	\N
255	Такаши	Шимура	1905-03-12	1982-02-11	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Shimura_Takashi.JPG/250px-Shimura_Takashi.JPG	\N
258	Юэн	Бремнер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/MJK31286_Ewen_Bremner_%28T2_Trainspotting%2C_Berlinale_2017%29.jpg/250px-MJK31286_Ewen_Bremner_%28T2_Trainspotting%2C_Berlinale_2017%29.jpg	\N
260	Анна	Фарис	1976-11-29	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Feed_America%2C_Cloudy_with_a_Chance_of_Meatballs_2%2C_Anna_Faris_%28cropped%29.jpg/250px-Feed_America%2C_Cloudy_with_a_Chance_of_Meatballs_2%2C_Anna_Faris_%28cropped%29.jpg	\N
265	Саманта	Ислер	1998-10-26	\N	\N	\N
267	Алан	Альда	1936-01-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Alan_Alda_%2822499650074%29_%28cropped%29.jpg/250px-Alan_Alda_%2822499650074%29_%28cropped%29.jpg	\N
268	Элль	Фаннинг	1998-04-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Elle_Fanning_at_the_2025_Cannes_Film_Festival.jpg/250px-Elle_Fanning_at_the_2025_Cannes_Film_Festival.jpg	\N
270	Кайл	Чендлер	1965-09-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Kyle_Chandler_2018.png/250px-Kyle_Chandler_2018.png	\N
274	Джош	Хатчерсон	1992-10-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Josh_Hutcherson_by_Gage_Skidmore_2.jpg/250px-Josh_Hutcherson_by_Gage_Skidmore_2.jpg	\N
275	Джош	Бролин	1968-02-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Josh_Brolin_TIFF_2025_%28cropped%29.jpg/250px-Josh_Brolin_TIFF_2025_%28cropped%29.jpg	\N
277	Александр	Скарсгард	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Alexander_Skarsg%C3%A5rd_at_NYFF_2025_04.jpg/250px-Alexander_Skarsg%C3%A5rd_at_NYFF_2025_04.jpg	\N
279	Клаас	Хлопнуть	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Claes_Bang-67419.jpg/250px-Claes_Bang-67419.jpg	\N
280	Виола	Дэвис	1965-08-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Viola_Davis_at_the_Air_Premiere_at_SXSW_%28cropped%29.jpg/250px-Viola_Davis_at_the_Air_Premiere_at_SXSW_%28cropped%29.jpg	\N
281	Октавия	Спенсер	1970-05-25	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/%22Hidden_Figures%22_Screening_at_the_White_House_%28NHQ201612150008%29_%28cropped%29.jpg/250px-%22Hidden_Figures%22_Screening_at_the_White_House_%28NHQ201612150008%29_%28cropped%29.jpg	\N
285	Бенедикт	Камбербэтч	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Benedict_Cumberbatch-67555.jpg/250px-Benedict_Cumberbatch-67555.jpg	\N
286	Кевин	Костнер	1955-01-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Kevin_Costner_at_81st_Venice_Film_Festival_%28cropped%29.jpg/250px-Kevin_Costner_at_81st_Venice_Film_Festival_%28cropped%29.jpg	\N
287	Вуди	Харрельсон	1961-07-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Woody_Harrelson_191020-N-NU281-1028_%28cropped%29.jpg/250px-Woody_Harrelson_191020-N-NU281-1028_%28cropped%29.jpg	\N
289	Джейсон	Момоа	1979-08-01	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Jason_Momoa_%2843055621224%29_%28cropped%29.jpg/250px-Jason_Momoa_%2843055621224%29_%28cropped%29.jpg	\N
241	Хартмут	Пульс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Bundesarchiv_Bild_183-82489-0001%2C_Hartmut_Puls%2C_Kroppe.jpg/250px-Bundesarchiv_Bild_183-82489-0001%2C_Hartmut_Puls%2C_Kroppe.jpg	Германия
250	Люпита	Нионго	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Lupita_Nyong%27o_by_Gage_Skidmore_4.jpg/250px-Lupita_Nyong%27o_by_Gage_Skidmore_4.jpg	Мексика
257	Юэн	МакГрегор	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Ewan_McGregor_-_Los_Angeles_Comic_Con_2024.jpg/250px-Ewan_McGregor_-_Los_Angeles_Comic_Con_2024.jpg	Великобритания
259	Джонни	Ли Миллер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/MJK31291_Jonny_Lee_Miller_%28T2_Trainspotting%2C_Berlinale_2017%29.jpg/250px-MJK31291_Jonny_Lee_Miller_%28T2_Trainspotting%2C_Berlinale_2017%29.jpg	Великобритания
262	Алисия	Викандер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Alicia_Vikander-7756.jpg/250px-Alicia_Vikander-7756.jpg	Швеция
293	Алдис	Ходж	1986-09-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Aldis_Hodge_at_Washington_Convention_Center_for_Congressional_Black_Caucus_ALC54_2025_2.jpg/250px-Aldis_Hodge_at_Washington_Convention_Center_for_Congressional_Black_Caucus_ALC54_2025_2.jpg	\N
294	Томми	Ли Джонс	1946-09-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Tommy_Lee_Jones_the_Jury_President_at_Opening_Ceremony_of_the_Tokyo_International_Film_Festival_2017_%2825332220247%29.jpg/250px-Tommy_Lee_Jones_the_Jury_President_at_Opening_Ceremony_of_the_Tokyo_International_Film_Festival_2017_%2825332220247%29.jpg	\N
297	Анна	Кендрик	1985-08-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Anna_Kendrick_Cannes_2016_2.jpg/250px-Anna_Kendrick_Cannes_2016_2.jpg	\N
298	Шахаб	Хоссейни	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Shahab_Hosseini_20250202_%28cropped%29.jpg/250px-Shahab_Hosseini_20250202_%28cropped%29.jpg	\N
299	Таране	Алидоости	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Taraneh_Alidoosti%2C_The_Salesman_news_conference_%2813950311005853135%29.jpg/250px-Taraneh_Alidoosti%2C_The_Salesman_news_conference_%2813950311005853135%29.jpg	\N
300	Мина	Садати	1981-11-24	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Fajr_International_Film_Festival_-_Tabestane_Dagh_Press_Conference_15.jpg/250px-Fajr_International_Film_Festival_-_Tabestane_Dagh_Press_Conference_15.jpg	\N
302	Дженнифер	Энистон	1969-02-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/JenniferAnistonHWoFFeb2012.jpg/250px-JenniferAnistonHWoFFeb2012.jpg	\N
303	Люк	Эванс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Luke_Evans_in_2018_%28cropped_4%29.jpg/250px-Luke_Evans_in_2018_%28cropped_4%29.jpg	\N
304	Клинт	Иствуд	1930-05-31	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Clint_Eastwood_visits_MCB_Camp_Pendleton_%281%29_%28cropped%29.jpg/250px-Clint_Eastwood_visits_MCB_Camp_Pendleton_%281%29_%28cropped%29.jpg	\N
306	Ли	Ван Клиф	1925-01-09	1989-12-16	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Lee_Van_Cleef_-_Death_Rides_A_Horse_%281%29.jpg/250px-Lee_Van_Cleef_-_Death_Rides_A_Horse_%281%29.jpg	\N
307	Эми	Полер	1971-09-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Amy_Poehler_%2853671989427%29_cropped.jpg/250px-Amy_Poehler_%2853671989427%29_cropped.jpg	\N
308	Счет	Хадер	1978-06-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Bill_Hader_%2829419489470%29_%28cropped%29.jpg/250px-Bill_Hader_%2829419489470%29_%28cropped%29.jpg	\N
313	Пол	Радд	1969-04-06	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Paul_Rudd_and_Kate_Mara_at_the_2024_Toronto_International_Film_Festival_8_%28cropped%29.jpg/250px-Paul_Rudd_and_Kate_Mara_at_the_2024_Toronto_International_Film_Festival_8_%28cropped%29.jpg	\N
314	Эванджелин	Лилли	1979-08-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Evangeline_Lilly_%2853390939662%29.jpg/250px-Evangeline_Lilly_%2853390939662%29.jpg	\N
315	Майкл	Пенья	1976-01-13	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Michael_Pe%C3%B1a_TIFF_2015.jpg/250px-Michael_Pe%C3%B1a_TIFF_2015.jpg	\N
316	Иона	Холм	1983-12-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Jonah_Hill-4939_%28cropped%29_%28cropped%29.jpg/250px-Jonah_Hill-4939_%28cropped%29_%28cropped%29.jpg	\N
319	Химеш	Патель	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Himesh_Patel_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg/250px-Himesh_Patel_at_the_2024_Toronto_International_Film_Festival_2_%28cropped%29.jpg	\N
320	Лили	Джеймс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Lilly_James_%2835744205321%29.jpg/250px-Lilly_James_%2835744205321%29.jpg	\N
321	София	Ди Мартино	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/ARealPainBFILFF131024_%2843_of_138%29_%2854063996577%29_%28cropped%29.jpg/250px-ARealPainBFILFF131024_%2843_of_138%29_%2854063996577%29_%28cropped%29.jpg	\N
322	Хилари	Суонк	1974-07-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Hilary_Swank_at_28th_Tokyo_International_Film_Festival.jpg/250px-Hilary_Swank_at_28th_Tokyo_International_Film_Festival.jpg	\N
323	Морган	Фриман	1937-06-01	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Morgan_Freeman_at_The_Pentagon_on_2_August_2023_-_230802-D-PM193-3363_%28cropped%29.jpg/250px-Morgan_Freeman_at_The_Pentagon_on_2_August_2023_-_230802-D-PM193-3363_%28cropped%29.jpg	\N
325	Фелисити	Джонс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Felicity_Jones_at_TIFF_2025_01_%28cropped%29.jpg/250px-Felicity_Jones_at_TIFF_2025_01_%28cropped%29.jpg	\N
328	Дэнни	МакБрайд	1976-12-29	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Danny_McBride_WonderCon_2013.jpg/250px-Danny_McBride_WonderCon_2013.jpg	\N
329	Майя	Рудольф	1972-07-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Maya_Rudolph_%28portrait_cropped%29.jpg/250px-Maya_Rudolph_%28portrait_cropped%29.jpg	\N
332	Джон	Гудман	1952-06-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/John_Goodman_%2830383991304%29_%28cropped%29.jpg/250px-John_Goodman_%2830383991304%29_%28cropped%29.jpg	\N
291	Виллем	Дефо	1955-07-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Willem_Dafoe-63668_%28cropped%29.jpg/250px-Willem_Dafoe-63668_%28cropped%29.jpg	США
338	Джейк	Джонсон	1978-05-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Jake_Johnson_by_Gage_Skidmore.jpg/250px-Jake_Johnson_by_Gage_Skidmore.jpg	\N
340	Шарлто	Копли	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Sharlto_Copley_on_the_Green_Carpet_at_the_2025_Zurich_Film_Festival_01.jpg/250px-Sharlto_Copley_on_the_Green_Carpet_at_the_2025_Zurich_Film_Festival_01.jpg	\N
342	Нильс	Аструп	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Niels_Arestrup_C%C3%A9sars_2014.jpg/250px-Niels_Arestrup_C%C3%A9sars_2014.jpg	\N
343	Адель	Беншериф	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Equipe_film_frontieres-Adel_Bencherif.jpg/250px-Equipe_film_frontieres-Adel_Bencherif.jpg	\N
348	Адам	Севани	1992-06-29	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Adam_Sevani_1.jpg/250px-Adam_Sevani_1.jpg	\N
349	Джон	К. Рейли	1965-05-24	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/John_C._Reilly_%2843646997525%29_%28cropped_2%29.jpg/250px-John_C._Reilly_%2843646997525%29_%28cropped_2%29.jpg	\N
351	Джейн	Линч	1960-07-14	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Jane_Lynch_at_the_2016_Willfilm_Awards.jpg/250px-Jane_Lynch_at_the_2016_Willfilm_Awards.jpg	\N
352	Элизабет	Олсен	1989-02-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Elizabeth_Olsen_-_Los_Angeles_Comic_Con_2025.jpg/250px-Elizabeth_Olsen_-_Los_Angeles_Comic_Con_2025.jpg	\N
353	Дж.К.	Симмонс	1955-01-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/JK_Simmons_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg/250px-JK_Simmons_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg	\N
354	Том	Хиддлстон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Tom_Hiddleston_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg/250px-Tom_Hiddleston_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg	\N
356	Мишель	Монаган	1976-03-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Michelle_Monaghan_%2842734734175%29_%28cropped%29.jpg/250px-Michelle_Monaghan_%2842734734175%29_%28cropped%29.jpg	\N
357	Дермот	Малруни	1963-10-31	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Dermot_Mulroney_Photo_Op_Nightmare_Weekend_Chicago_2025.jpg/250px-Dermot_Mulroney_Photo_Op_Nightmare_Weekend_Chicago_2025.jpg	\N
358	Дензел	Вашингтон	1954-12-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Denzel_Washington_at_the_2025_Cannes_Film_Festival.jpg/250px-Denzel_Washington_at_the_2025_Cannes_Film_Festival.jpg	\N
359	Крис	Пратт	1979-06-21	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Chris_Pratt_Jurassic_World_Fallen_Kingdom_Japan_Premiere_Red_Carpet_%283x4_cropped%29.jpg/250px-Chris_Pratt_Jurassic_World_Fallen_Kingdom_Japan_Premiere_Red_Carpet_%283x4_cropped%29.jpg	\N
361	Тараджи	П. Хенсон	1970-09-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/-Hidden_Figures-_Film_Celebration_%28NHQ201612100020%29_%28cropped%29.jpg/250px--Hidden_Figures-_Film_Celebration_%28NHQ201612100020%29_%28cropped%29.jpg	\N
362	Джанель	Монэ	1985-12-01	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Janelle_Monae_Paris_Fashion_Week_Autumn_Winter_2019_%28cropped%29.jpg/250px-Janelle_Monae_Paris_Fashion_Week_Autumn_Winter_2019_%28cropped%29.jpg	\N
364	Лесли	Одом младший	1981-08-06	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Leslie_Odom_Jr._2024_%28cropped%29.jpg/250px-Leslie_Odom_Jr._2024_%28cropped%29.jpg	\N
367	Роберт	Редфорд	1936-08-18	2025-09-16	https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Tell_Them_Willie_Boy_Is_Here_%E2%80%93_Robert_Redford_photo.jpg/250px-Tell_Them_Willie_Boy_Is_Here_%E2%80%93_Robert_Redford_photo.jpg	\N
369	Эмма	Томпсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Emma_Thompson_at_the_78th_Locarno_Film_Festival_photocall_01_%28cropped%29.jpg/250px-Emma_Thompson_at_the_78th_Locarno_Film_Festival_photocall_01_%28cropped%29.jpg	\N
371	Джей	Барушель	1982-04-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Jay_Baruchel_Joint_Base_McGuire-Dix-Lakehurst_2014_crop.jpg/250px-Jay_Baruchel_Joint_Base_McGuire-Dix-Lakehurst_2014_crop.jpg	\N
374	Пилу	Асбек	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Pilou_Asb%C3%A6k_2025.jpg/250px-Pilou_Asb%C3%A6k_2025.jpg	\N
376	Брэд	Питт	1963-12-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Brad_Pitt-69858.jpg/250px-Brad_Pitt-69858.jpg	\N
377	Кевин	Спейси	1959-07-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Kevin_Spacey-9243.jpg/250px-Kevin_Spacey-9243.jpg	\N
378	Джейсон	Бейтман	1969-01-14	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Jason_Batement_at_the_Air_Premiere_%28cropped%29.jpg/250px-Jason_Batement_at_the_Air_Premiere_%28cropped%29.jpg	\N
380	Джастин	Тимберлейк	1981-01-31	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Justin_Timberlake_by_Gage_Skidmore_2.jpg/250px-Justin_Timberlake_by_Gage_Skidmore_2.jpg	\N
381	Аманда	Сейфрид	1985-12-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Amanda_Seyfried_at_Berlinale_2024%2C_cropped_%283x4_cropped%29.jpg/250px-Amanda_Seyfried_at_Berlinale_2024%2C_cropped_%283x4_cropped%29.jpg	\N
344	Сандра	Буллок	1964-07-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Sandra_Bullock_at_The_Egyptian_Theatre_2024.jpg/250px-Sandra_Bullock_at_The_Egyptian_Theatre_2024.jpg	Германия
346	Шарни	Винсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Sharni_Vinson_2011.jpg/250px-Sharni_Vinson_2011.jpg	Австралия
370	Майкл	Дуглас	1944-09-25	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/59th_Karlovy_Vary_International_Film_Festival%2C_Michael_Douglas_07_%28cropped%29.jpg/250px-59th_Karlovy_Vary_International_Film_Festival%2C_Michael_Douglas_07_%28cropped%29.jpg	США
373	Скарлетт	Йоханссон	1984-11-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Scarlett_Johansson-8588.jpg/250px-Scarlett_Johansson-8588.jpg	США
382	Киллиан	Мерфи	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/CillianMurphy-TIFF2025-01-Cropped_%28cropped%29.png/250px-CillianMurphy-TIFF2025-01-Cropped_%28cropped%29.png	\N
383	Стив	Карелл	1962-08-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Steve_Carell_-_The_40-Year-Old-Virgin.jpg/250px-Steve_Carell_-_The_40-Year-Old-Virgin.jpg	\N
385	Бенджамин	Брэтт	1963-12-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Benjamin_Bratt_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg/250px-Benjamin_Bratt_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg	\N
387	Винс	Вон	1970-03-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Actor_Vince_Vaughn_%282025%29_%28cropped%29.jpg/250px-Actor_Vince_Vaughn_%282025%29_%28cropped%29.jpg	\N
388	Екатерина	Кинер	1959-03-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Catherine_Keener_-_The_40-Year-Old-Virgin.jpg/250px-Catherine_Keener_-_The_40-Year-Old-Virgin.jpg	\N
389	Саша	Барон Коэн	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Sacha_Baron_Cohen_%282024%29_03.jpg/250px-Sacha_Baron_Cohen_%282024%29_03.jpg	\N
391	Джек	Николсон	1937-04-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Jack_Nicholson_2001.jpg/250px-Jack_Nicholson_2001.jpg	\N
392	Луиза	Флетчер	1934-07-22	2022-09-23	https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/LouiseFletcherOscar_%28cropped%29.jpg/250px-LouiseFletcherOscar_%28cropped%29.jpg	\N
393	Майкл	Берриман	1948-09-04	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Michael_Berryman_2007.png/250px-Michael_Berryman_2007.png	\N
397	Марион	Котийяр	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Marion_Cotillard_at_2019_Cannes.jpg/250px-Marion_Cotillard_at_2019_Cannes.jpg	\N
398	Джаред	Харрис	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Jared_Harris_A_House_of_Dynamite-08_%28cropped%29.jpg/250px-Jared_Harris_A_House_of_Dynamite-08_%28cropped%29.jpg	\N
400	Зак	Эфрон	1987-10-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Zac_Efron_at_the_Baywatch_Red_Carpet_Premiere_Sydney_Australia.jpg/250px-Zac_Efron_at_the_Baywatch_Red_Carpet_Premiere_Sydney_Australia.jpg	\N
402	Дакота	Джонсон	1989-10-04	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/59th_Karlovy_Vary_International_Film_Festival%2C_Dakota_Johnson_04_%28cropped%29.jpg/250px-59th_Karlovy_Vary_International_Film_Festival%2C_Dakota_Johnson_04_%28cropped%29.jpg	\N
403	Джейми	Дорнан	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Jamie_Dornan_in_2016.png/250px-Jamie_Dornan_in_2016.png	\N
405	Меган	Лиса	1986-05-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Megan_Fox_in_2023_01.jpg/250px-Megan_Fox_in_2023_01.jpg	\N
406	Хоакин	Финикс	1974-10-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Joaquin_Phoenix-64908_%28cropped%29.jpg/250px-Joaquin_Phoenix-64908_%28cropped%29.jpg	\N
407	Хлоя	Грейс Морец	1997-02-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Chlo%C3%AB_Grace_Moretz_The_Peripheral_NYCC_2022_%28cropped%29.jpg/250px-Chlo%C3%AB_Grace_Moretz_The_Peripheral_NYCC_2022_%28cropped%29.jpg	\N
411	Кристофер	Ллойд	1938-10-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/ChristopherLloyd2022.jpg/250px-ChristopherLloyd2022.jpg	\N
412	Леа	Томпсон	1961-05-31	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Lea_Thompson_%2853319047148%29.jpg/250px-Lea_Thompson_%2853319047148%29.jpg	\N
413	Майкл	Кларк Дункан	1957-12-10	2012-09-03	https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/MClarkeDuncan021109-R106_%2850094589037%29.jpg/250px-MClarkeDuncan021109-R106_%2850094589037%29.jpg	\N
415	Крейг	Т. Нельсон	1944-04-04	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Craig_T._Nelson_at_PaleyFest_2013.jpg/250px-Craig_T._Nelson_at_PaleyFest_2013.jpg	США
416	Холли	Охотник	1958-03-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Holly_Hunter_by_Gage_Skidmore_2.jpg/250px-Holly_Hunter_by_Gage_Skidmore_2.jpg	США
417	Чарльз	Чаплин	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Charlie_Chaplin_portrait_Getty_1739411952.jpg/250px-Charlie_Chaplin_portrait_Getty_1739411952.jpg	США
419	Генри	Бергман	1868-02-23	1946-10-22	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Henry_Bergman_1917.jpg/250px-Henry_Bergman_1917.jpg	США
421	Энцо	Каннавале	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Enzo_Cannavale_1975.png/250px-Enzo_Cannavale_1975.png	США
422	Антонелла	Аттили	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Antonella_Attili.jpg/250px-Antonella_Attili.jpg	США
423	Том	Сайзмор	1961-11-29	2023-03-03	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Tom_Sizemore_by_Jean_Claude_Vera_in_April_2011.jpg/250px-Tom_Sizemore_by_Jean_Claude_Vera_in_April_2011.jpg	США
426	Эдвард	Нортон	1969-08-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Ed_Norton_and_Shauna_Robertson_TIFF_2025_%28cropped%29.jpg/250px-Ed_Norton_and_Shauna_Robertson_TIFF_2025_%28cropped%29.jpg	США
427	Эдвард	Фарлонг	1977-08-02	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Edward_Furlong_%2853725363105%29.jpg/250px-Edward_Furlong_%2853725363105%29.jpg	США
428	Беверли	Д'Анджело	1951-11-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Beverly_D%27Angelo_2%2C_2012.jpg/250px-Beverly_D%27Angelo_2%2C_2012.jpg	США
430	Чазз	Пальминтери	1952-05-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Chazz_Palminteri_2011_Shankbone.JPG/250px-Chazz_Palminteri_2011_Shankbone.JPG	США
431	Дон	Риклз	1926-05-08	2017-04-06	https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Don_Rickles_1973.JPG/250px-Don_Rickles_1973.JPG	США
439	Джозеф	Гордон-Левитт	1981-02-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Joseph_Gordon-Levitt_TechCrunch_Disrupt_San_Francisco_2019_-_Day_1_%28cropped%29.jpeg/250px-Joseph_Gordon-Levitt_TechCrunch_Disrupt_San_Francisco_2019_-_Day_1_%28cropped%29.jpeg	США
399	Дуэйн	Джонсон	1972-05-02	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Dwayne_Johnson-1809_%28cropped%29.jpg/250px-Dwayne_Johnson-1809_%28cropped%29.jpg	США
436	Цутому	Тацуми	\N	\N	\N	Япония
442	Энтони	Перкинс	1932-04-04	1992-09-12	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Anthony_Perkins_3_Allan_Warren.jpg/250px-Anthony_Perkins_3_Allan_Warren.jpg	Великобритания
443	Джанет	Ли	1927-07-06	2004-10-03	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Janet_Leigh_1954_portrait.png/250px-Janet_Leigh_1954_portrait.png	США
445	Карен	Аллен	1951-10-05	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Karenallen17_cropped.jpg/250px-Karenallen17_cropped.jpg	США
447	Джеймс	Стюарт	1908-05-20	1997-07-02	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Annex_-_Stewart%2C_James_%28Call_Northside_777%29_01.jpg/250px-Annex_-_Stewart%2C_James_%28Call_Northside_777%29_01.jpg	США
449	Лайонел	Бэрримор	1878-04-28	1954-11-15	https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Lionel_Barrymore_2.jpg/250px-Lionel_Barrymore_2.jpg	США
480	Тим	Роббинс	1958-10-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Tim_Robbins_%28Berlin_Film_Festival_2013%29.jpg/250px-Tim_Robbins_%28Berlin_Film_Festival_2013%29.jpg	\N
482	Марлон	Брандо	1924-04-03	2004-07-01	https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Marlon_Brando_publicity_for_One-Eyed_Jacks.png/250px-Marlon_Brando_publicity_for_One-Eyed_Jacks.png	\N
483	Джеймс	Каан	1940-03-26	2022-07-06	https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/James_Caan_Cannes_2013.jpg/250px-James_Caan_Cannes_2013.jpg	\N
484	Хит	Леджер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Heath_Ledger_%282%29.jpg/250px-Heath_Ledger_%282%29.jpg	\N
638	Андреа	Райзборо	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Andrea_Riseborough_2012.jpg/250px-Andrea_Riseborough_2012.jpg	\N
485	Аарон	Экхарт	1968-03-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Aaron_Eckhart_%2829830286295%29_%28cropped%29.jpg/250px-Aaron_Eckhart_%2829830286295%29_%28cropped%29.jpg	\N
487	Ли	Дж. Кобб	1911-12-08	1976-02-11	https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Lee_J._Cobb_1960s.JPG/250px-Lee_J._Cobb_1960s.JPG	\N
488	Мартин	Бальзам	1919-11-04	1996-02-13	https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Martin_Balsam_Film_Still.jpg/250px-Martin_Balsam_Film_Still.jpg	\N
491	Бен	Кингсли	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Ben_Kingsley_by_Gage_Skidmore.jpg/250px-Ben_Kingsley_by_Gage_Skidmore.jpg	\N
492	Джон	Траволта	1954-02-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/John_Travolta_Cannes_2018_%28cropped%29.jpg/250px-John_Travolta_Cannes_2018_%28cropped%29.jpg	\N
495	Эллен	Берстин	1932-12-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Ellen_Burstyn_at_the_2009_Tribeca_Film_Festival.jpg/250px-Ellen_Burstyn_at_the_2009_Tribeca_Film_Festival.jpg	\N
496	Джаред	Лето	1971-12-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Jared_Leto_by_Gage_Skidmore_2.jpg/250px-Jared_Leto_by_Gage_Skidmore_2.jpg	\N
497	Дженнифер	Коннелли	1970-12-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Jennifer_Connelly_2010_TIFF.jpg/250px-Jennifer_Connelly_2010_TIFF.jpg	\N
501	Софи	Марсо	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Sophie_Marceau_Cabourg_2012.jpg/250px-Sophie_Marceau_Cabourg_2012.jpg	\N
505	Эд	Харрис	1950-11-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Ed_Harris_by_Gage_Skidmore.jpg/250px-Ed_Harris_by_Gage_Skidmore.jpg	\N
508	Кэмерон	Диас	1972-08-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Cameron_Diaz_September_2014.jpg/250px-Cameron_Diaz_September_2014.jpg	\N
509	Джонни	Депп	1963-06-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Johnny_Depp_2020.jpg/250px-Johnny_Depp_2020.jpg	\N
511	Лиев	Шрайбер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/MJK_08465_Liev_Schreiber_%28Berlinale_2018%29.jpg/250px-MJK_08465_Liev_Schreiber_%28Berlinale_2018%29.jpg	\N
512	Гал	Гадот	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Gal_Gadot_for_Revlon.png/250px-Gal_Gadot_for_Revlon.png	\N
513	Вин	Дизель	1967-07-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Vin_Diesel_by_Gage_Skidmore_2.jpg/250px-Vin_Diesel_by_Gage_Skidmore_2.jpg	\N
515	Мишель	Родригес	1978-07-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Michelle_Rodriguez_Cannes_2018_cropped.jpg/250px-Michelle_Rodriguez_Cannes_2018_cropped.jpg	\N
516	Брэдли	Купер	1975-01-05	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Bradley_Cooper_Is_This_Thing_On-41_%28cropped%29.jpg/250px-Bradley_Cooper_Is_This_Thing_On-41_%28cropped%29.jpg	\N
517	Хавьер	Бардем	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Javier_Bardem_Cannes_2018.jpg/250px-Javier_Bardem_Cannes_2018.jpg	\N
494	Мит	Лоаф	1947-09-27	2022-01-20	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Meatloaf_1971_%28cropped%29.JPG/250px-Meatloaf_1971_%28cropped%29.JPG	\N
489	Лиам	Нисон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Liam_Neeson_Deauville_2012_2.jpg/250px-Liam_Neeson_Deauville_2012_2.jpg	Великобритания
521	Николас	Холт	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Nicholas_Hoult-67849_%28cropped%29.jpg/250px-Nicholas_Hoult-67849_%28cropped%29.jpg	\N
523	Нуми	Рапас	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Noomi_Rapace_PFW_2019.jpg/250px-Noomi_Rapace_PFW_2019.jpg	\N
524	Логан	Маршалл-Грин	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Logan-Marshall-Interview.jpg/250px-Logan-Marshall-Interview.jpg	\N
525	Майкл	Фассбендер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Michael_Fassbender_by_Gage_Skidmore_2015.jpg/250px-Michael_Fassbender_by_Gage_Skidmore_2015.jpg	\N
527	Воля	Феррелл	1967-07-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Will_Ferrell_at_the_2024_Toronto_International_Film_Festival_5_%28cropped%29.jpg/250px-Will_Ferrell_at_the_2024_Toronto_International_Film_Festival_5_%28cropped%29.jpg	\N
529	Филип	Сеймур Хоффман	1967-07-23	2014-02-02	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Philip_Seymour_Hoffman_2011.jpg/250px-Philip_Seymour_Hoffman_2011.jpg	\N
530	Джереми	Ирвин	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Jeremy_Irvine_2011.jpg/250px-Jeremy_Irvine_2011.jpg	\N
531	Эмили	Ватсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Emily_Watson_at_Berlinale_2024_%28cropped%29.jpg/250px-Emily_Watson_at_Berlinale_2024_%28cropped%29.jpg	\N
533	Жан	Дюжарден	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Christophe_Lambert_et_Jean_Dujardin_%28Cropped%29.jpg/250px-Christophe_Lambert_et_Jean_Dujardin_%28Cropped%29.jpg	\N
537	Рэнди	Кутюр	1963-06-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Randy_Couture_by_Gage_Skidmore_2.jpg/250px-Randy_Couture_by_Gage_Skidmore_2.jpg	\N
668	Ли	Сун Гюн	1975-03-02	2023-12-27	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Lee_Seon-gun_in_Oct_2018.png/250px-Lee_Seon-gun_in_Oct_2018.png	\N
538	Аарон	Тейлор-Джонсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Aaron_Taylor-Johnson_at_82nd_Venice_International_Film_Festival-1_%28cropped%29.jpg/250px-Aaron_Taylor-Johnson_at_82nd_Venice_International_Film_Festival-1_%28cropped%29.jpg	\N
539	Дилан	О'Брайен	1991-08-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/2025_Dylan_O%27Brien_%28cropped%29.jpg/250px-2025_Dylan_O%27Brien_%28cropped%29.jpg	\N
542	Мэтью	МакКонахи	1969-11-04	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Matthew_McConaughey_at_the_2025_Toronto_Film_Festival_%28Cropped%29.jpg/250px-Matthew_McConaughey_at_the_2025_Toronto_Film_Festival_%28Cropped%29.jpg	\N
543	Эдгар	Рамирес	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Edgar_Ramirez_at_the_2024_Toronto_International_Film_Festival_3_%28cropped%29.jpg/250px-Edgar_Ramirez_at_the_2024_Toronto_International_Film_Festival_3_%28cropped%29.jpg	\N
546	Патрик	Стюарт	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Patrick_Stewart_by_Gage_Skidmore_2.jpg/250px-Patrick_Stewart_by_Gage_Skidmore_2.jpg	\N
550	Бретань	Снег	1986-03-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Brittany_Snow_in_2019.jpg/250px-Brittany_Snow_in_2019.jpg	\N
551	Мятежник	Уилсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Rebel_Wilson_%286707611099%29_%28cropped%29.jpg/250px-Rebel_Wilson_%286707611099%29_%28cropped%29.jpg	\N
553	Энди	Серкис	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Andy_Serkis_at_MEGACON_Orlando_2025.png/250px-Andy_Serkis_at_MEGACON_Orlando_2025.png	\N
556	Нил	Патрик Харрис	1973-06-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/NeilPatrickHarris-byPhilipRomano.jpg/250px-NeilPatrickHarris-byPhilipRomano.jpg	\N
557	Адель	Экзаркопулос	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Ad%C3%A8le_Exarchopoulos_at_82nd_Venice_International_Film_Festival-1_%28cropped%29.jpg/250px-Ad%C3%A8le_Exarchopoulos_at_82nd_Venice_International_Film_Festival-1_%28cropped%29.jpg	\N
559	Джон	Хамм	1971-03-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/JonHamm-byPhilipRomano.jpg/250px-JonHamm-byPhilipRomano.jpg	\N
560	Дженнифер	Эль	1969-12-29	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Jennifer_Ehle_%2830443863926%29.jpg/250px-Jennifer_Ehle_%2830443863926%29.jpg	\N
562	Питер	Сарсгаард	1971-03-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Peter_Sarsgaard_2019.jpg/250px-Peter_Sarsgaard_2019.jpg	\N
563	София	Бутелла	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Sofia_Boutella_%2834705024651%29.jpg/250px-Sofia_Boutella_%2834705024651%29.jpg	\N
564	Аннабель	Уоллис	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Annabelle_Wallis_%2834027166033%29.jpg/250px-Annabelle_Wallis_%2834027166033%29.jpg	\N
566	Джон	Бойега	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/John_Boyega_by_Gage_Skidmore.jpg/250px-John_Boyega_by_Gage_Skidmore.jpg	\N
534	Беренис	Бежо	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/B%C3%A9r%C3%A9nice_Bejo_Cannes_2016.jpg/250px-B%C3%A9r%C3%A9nice_Bejo_Cannes_2016.jpg	Аргентина
535	Кейт	Бланшетт	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Cate_Blanchett-63298_%28cropped_2%29.jpg/250px-Cate_Blanchett-63298_%28cropped_2%29.jpg	Австралия
549	Оливия	Уайльд	1984-03-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Olivia_Wilde_in_2022.jpg/250px-Olivia_Wilde_in_2022.jpg	США
568	Томазен	Маккензи	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Thomasin_McKenzie_in_2024_%28cropped%29.jpg/250px-Thomasin_McKenzie_in_2024_%28cropped%29.jpg	\N
569	Эмилия	Кларк	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Emilia_Clarke_at_the_2023_Harper%27s_Bazaar_Women_of_the_Year_Awards.jpg/250px-Emilia_Clarke_at_the_2023_Harper%27s_Bazaar_Women_of_the_Year_Awards.jpg	\N
573	Эрик	Стоунстрит	1971-09-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Eric_Stonestreet_at_2015_PaleyFest.jpg/250px-Eric_Stonestreet_at_2015_PaleyFest.jpg	\N
575	Тэрон	Эгертон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Taron_Egerton_by_Gage_Skidmore_2.jpg/250px-Taron_Egerton_by_Gage_Skidmore_2.jpg	\N
576	Рене	Руссо	1954-02-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Rene_Russo_1996.jpg/250px-Rene_Russo_1996.jpg	\N
577	Джиннифер	Гудвин	1978-05-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ginnifer_Goodwin_by_Gage_Skidmore_%28cropped%29.jpg/250px-Ginnifer_Goodwin_by_Gage_Skidmore_%28cropped%29.jpg	\N
581	Моника	Вилла	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Monica_Villa_before_a_rehearsal.jpg/250px-Monica_Villa_before_a_rehearsal.jpg	\N
582	Нил	Сетхи	\N	\N	https://upload.wikimedia.org/wikipedia/en/a/a4/The_Jungle_Book_%282016%29.jpg	\N
583	Счет	Мюррей	1950-09-21	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Bill_Murray_at_the_2025_Sundance_Film_Festival_2_%28cropped%29.jpg/250px-Bill_Murray_at_the_2025_Sundance_Film_Festival_2_%28cropped%29.jpg	\N
584	Патрик	Уилсон	1973-07-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Patrick_Wilson_Jay_Kelly-51_%28cropped%29.jpg/250px-Patrick_Wilson_Jay_Kelly-51_%28cropped%29.jpg	\N
669	Чо	Ё Чжон	1981-02-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cho_Yeo-jung_in_Dec_2019_%28Revised%29.png/250px-Cho_Yeo-jung_in_Dec_2019_%28Revised%29.png	\N
589	Лора	Линни	1964-02-05	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Laura_Linney_Berlinale_2017.jpg/250px-Laura_Linney_Berlinale_2017.jpg	\N
591	Джеймс	МакЭвой	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/James_McAvoy_by_Gage_Skidmore_2.jpg/250px-James_McAvoy_by_Gage_Skidmore_2.jpg	\N
592	Риз	Уизерспун	1976-03-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Reese_Witherspoon_at_TIFF_2014.jpg/250px-Reese_Witherspoon_at_TIFF_2014.jpg	\N
593	Сет	Макфарлейн	1973-10-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Seth_MacFarlane_SDCC_2017_%2836524516106%29.jpg/250px-Seth_MacFarlane_SDCC_2017_%2836524516106%29.jpg	\N
596	Сара	Вауэлл	1969-12-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Sarah_Vowell.jpg/250px-Sarah_Vowell.jpg	\N
597	Джессика	Честейн	1977-03-24	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Jessica_Chastain-64631_%28cropped%29.jpg/250px-Jessica_Chastain-64631_%28cropped%29.jpg	\N
599	Брайан	Крэнстон	1956-03-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Bryan_Cranston_2022_%283x4_cropped%29.jpg/250px-Bryan_Cranston_2022_%283x4_cropped%29.jpg	\N
600	Филиппа	Су	1990-05-31	\N	https://upload.wikimedia.org/wikipedia/commons/9/9c/Phillipa_Soo%2C_White_House%2C_March_2016_%28cropped%29.jpg	\N
602	Олден	Эренрайх	1989-11-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Solo_A_Star_Wars_Story_Japan_Premiere_Red_Carpet_Alden_Ehrenreich_%2841008143870%29.jpg/250px-Solo_A_Star_Wars_Story_Japan_Premiere_Red_Carpet_Alden_Ehrenreich_%2841008143870%29.jpg	\N
603	Зои	Салданья	1978-06-19	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Zoe_Salda%C3%B1a_at_the_2024_Toronto_International_Film_Festival_2_%28cropped_2%29.jpg/250px-Zoe_Salda%C3%B1a_at_the_2024_Toronto_International_Film_Festival_2_%28cropped_2%29.jpg	\N
609	Джеффри	Винсент Париз	\N	\N	https://upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/20px-OOjs_UI_icon_edit-ltr-progressive.svg.png	\N
612	Ха	Чон Ву	1978-03-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/%ED%95%98%EC%A0%95%EC%9A%B0%2C_%EC%98%81%ED%99%94_%27%EC%8B%A0%EA%B3%BC_%ED%95%A8%EA%BB%98%27_%EC%A3%84_%EC%99%80_%EB%B2%8C_20%EC%9D%BC_%EA%B0%9C%EB%B4%89_%2813%29_%28cropped%29.jpg/250px-%ED%95%98%EC%A0%95%EC%9A%B0%2C_%EC%98%81%ED%99%94_%27%EC%8B%A0%EA%B3%BC_%ED%95%A8%EA%BB%98%27_%EC%A3%84_%EC%99%80_%EB%B2%8C_20%EC%9D%BC_%EA%B0%9C%EB%B4%89_%2813%29_%28cropped%29.jpg	\N
613	Чо	Джин Ун	1976-03-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/ChoJin-woong_at_news_conference_of_movie_%EC%82%AC%EB%83%A5.jpg/250px-ChoJin-woong_at_news_conference_of_movie_%EC%82%AC%EB%83%A5.jpg	\N
614	Томас	Броди-Сангстер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Thomas_Brodie-Sangster_by_Gage_Skidmore_2.jpg/250px-Thomas_Brodie-Sangster_by_Gage_Skidmore_2.jpg	\N
571	Джанет	Мактир	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Janet_McTeer_Berlin_2015.jpg/250px-Janet_McTeer_Berlin_2015.jpg	США
617	Алия	Шаукат	1989-04-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Alia_Shawkat_at_the_2025_Sundance_Film_Festival_%28cropped%29.jpg/250px-Alia_Shawkat_at_the_2025_Sundance_Film_Festival_%28cropped%29.jpg	\N
619	Майкл	Сера	1988-06-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/MKr22364_Michael_Cera_%28The_Adults%2C_Berlinale_2023%29.jpg/250px-MKr22364_Michael_Cera_%28The_Adults%2C_Berlinale_2023%29.jpg	\N
621	Сушант	Сингх Раджпут	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Sushant_Singh_Rajput.jpg/250px-Sushant_Singh_Rajput.jpg	\N
622	Киара	Адвани	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Kiara_Advani_snapped_at_the_screening_of_Shershaah_%28cropped%29.jpg/250px-Kiara_Advani_snapped_at_the_screening_of_Shershaah_%28cropped%29.jpg	\N
623	Диша	Патани	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Disha_Patani_at_Grazia_Young_Fashion_Awards_2024_%28cropped%29.jpg/250px-Disha_Patani_at_Grazia_Young_Fashion_Awards_2024_%28cropped%29.jpg	\N
629	Ян	МакШейн	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/McShaneTamLinRio311022_%281_of_21%29_%2852470810951%29_%28cropped_3%C3%974%29.jpg/250px-McShaneTamLinRio311022_%281_of_21%29_%2852470810951%29_%28cropped_3%C3%974%29.jpg	\N
630	Роджер	Крейг Смит	1975-08-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Roger_Craig_Smith_%2854266951415%29.jpg/250px-Roger_Craig_Smith_%2854266951415%29.jpg	\N
631	Крис	Диамантопулос	1975-05-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Chris_Diamantopoulos_4th_Annual_Norma_Jean_Gala_%28cropped%29.jpg/250px-Chris_Diamantopoulos_4th_Annual_Norma_Jean_Gala_%28cropped%29.jpg	\N
633	Чарли	Шлаттер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Charlie_Schlatter_%2841695584254%29.jpg/250px-Charlie_Schlatter_%2841695584254%29.jpg	\N
634	Ричард	Раундтри	1942-07-09	2023-10-24	https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Richard_Roundtree_1973.JPG/250px-Richard_Roundtree_1973.JPG	\N
635	Майкл	Шеннон	1974-08-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/MichaelShannon-byPhilipRomano.jpg/250px-MichaelShannon-byPhilipRomano.jpg	\N
641	Хорхе	Лендеборг младший.	1996-01-21	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Jorge_Lendeborg_Jr._by_Gage_Skidmore.jpg/250px-Jorge_Lendeborg_Jr._by_Gage_Skidmore.jpg	\N
642	Джон	Сина	1977-04-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/John_Cena_by_Gage_Skidmore.jpg/250px-John_Cena_by_Gage_Skidmore.jpg	\N
644	Бинбин	Ли	1973-02-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Li_Bingbing.png/250px-Li_Bingbing.png	\N
645	Рэйнн	Уилсон	1966-01-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Rainn_Wilson_Photo_Op_GalaxyCon_Richmond_2025_%28cropped%29.jpg/250px-Rainn_Wilson_Photo_Op_GalaxyCon_Richmond_2025_%28cropped%29.jpg	\N
646	Фионн	Уайтхед	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Fionn_Whitehead_in_2019_%28cropped%29.jpg/250px-Fionn_Whitehead_in_2019_%28cropped%29.jpg	\N
647	Барри	Кеоган	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Barry_Keoghan_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg/250px-Barry_Keoghan_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg	\N
649	Дэниел	Калуя	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Daniel_Kaluuya_%282017%29.jpg/250px-Daniel_Kaluuya_%282017%29.jpg	\N
650	Эллисон	Уильямс	1988-04-13	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Allison_Williams_DSM-11_%28cropped%29.jpg/250px-Allison_Williams_DSM-11_%28cropped%29.jpg	\N
651	Брэдли	Уитфорд	1959-10-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Bradley_Whitford_Photo_Op_GalaxyCon_Richmond_2025.jpg/250px-Bradley_Whitford_Photo_Op_GalaxyCon_Richmond_2025.jpg	\N
653	Джоэли	Ричардсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/JoelyRichardsonSept11TIFF.jpg/250px-JoelyRichardsonSept11TIFF.jpg	\N
655	Паттон	Освальт	1969-01-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Patton_Oswalt_in_2025_%28cropped%29.jpg/250px-Patton_Oswalt_in_2025_%28cropped%29.jpg	\N
657	Дженнифер	Гарнер	1972-04-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Jennifer_Garner_-_2024_%2854106107278%29_%28cropped%29.jpg/250px-Jennifer_Garner_-_2024_%2854106107278%29_%28cropped%29.jpg	\N
659	Салли	Хокинс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/MJK35133_Sally_Hawkins_%28Maudie%2C_Berlinale_2017%29.jpg/250px-MJK35133_Sally_Hawkins_%28Maudie%2C_Berlinale_2017%29.jpg	\N
660	Майкл	Штулбарг	1968-07-05	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Michael_Stuhlbarg_After_The_Hunt-36_%28cropped%29.jpg/250px-Michael_Stuhlbarg_After_The_Hunt-36_%28cropped%29.jpg	\N
661	Воля	Смит	1968-09-25	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/TechCrunch_Disrupt_San_Francisco_2019_-_Day_1_%2848834070763%29_%28cropped%29.jpg/250px-TechCrunch_Disrupt_San_Francisco_2019_-_Day_1_%2848834070763%29_%28cropped%29.jpg	\N
664	Маккензи	Дэвис	1987-04-01	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Mackenzie_Davis_by_Gage_Skidmore.jpg/250px-Mackenzie_Davis_by_Gage_Skidmore.jpg	\N
624	Элизабет	Дебики	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Elizabeth_Debicki_by_Gage_Skidmore.jpg/250px-Elizabeth_Debicki_by_Gage_Skidmore.jpg	Австралия
625	Стивен	Юн	1983-12-21	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Steven_Yeun_at_the_2025_Sundance_Film_Festival_%28cropped%29.jpg/250px-Steven_Yeun_at_the_2025_Sundance_Film_Festival_%28cropped%29.jpg	США
662	Мена	Масуд	1991-09-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Run_This_Town_cast_-_Mena_Massoud_%2833463322988%29.jpg/250px-Run_This_Town_cast_-_Mena_Massoud_%2833463322988%29.jpg	Канада
666	Миллисент	Симмондс	2003-03-06	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Millicent_simmonds_2021_1.jpg/250px-Millicent_simmonds_2021_1.jpg	Америка
674	Алекс	Хоннольд	1985-08-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Alex_Honnold_in_2023_in_Antarctica_%28cropped%29.jpg/250px-Alex_Honnold_in_2023_in_Antarctica_%28cropped%29.jpg	\N
675	Томми	Колдуэлл	1978-08-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Tommy_Caldwell_%282015%29.jpg/250px-Tommy_Caldwell_%282015%29.jpg	\N
678	Аквафина		1988-06-02	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Awkwafina_by_Gage_Skidmore.jpg/250px-Awkwafina_by_Gage_Skidmore.jpg	\N
679	Чарли	Ханнэм	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Charlie_Hunnam_%2853619946303%29.jpg/250px-Charlie_Hunnam_%2853619946303%29.jpg	\N
680	Мишель	Докери	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Michelle_Dockery_2019.jpg/250px-Michelle_Dockery_2019.jpg	\N
681	Флоренция	Пью	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Florence_Pugh_at_the_2024_Toronto_International_Film_Festival_13_%28cropped_2_%E2%80%93_color_adjusted%29.jpg/250px-Florence_Pugh_at_the_2024_Toronto_International_Film_Festival_13_%28cropped_2_%E2%80%93_color_adjusted%29.jpg	\N
684	Кристофер	Хейердал	1963-09-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Stuttgart_2024_-_ComicCon_-_Christopher_Heyerdahl_-_by-RaBoe_001_%28cropped%29.jpg/250px-Stuttgart_2024_-_ComicCon_-_Christopher_Heyerdahl_-_by-RaBoe_001_%28cropped%29.jpg	\N
685	Элейн	Хендрикс	1970-12-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Elaine_Hendrix_at_2015_ATX_TV_Festival.jpg/250px-Elaine_Hendrix_at_2015_ATX_TV_Festival.jpg	\N
686	Джемма	Чан	1982-11-29	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Gemma_Chan_at_82nd_Venice_International_Film_Festival-1.jpg/250px-Gemma_Chan_at_82nd_Venice_International_Film_Festival-1.jpg	\N
689	Дэйвид	Стратэйрн	1949-01-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/David_Strathairn_2022.jpg/250px-David_Strathairn_2022.jpg	\N
691	Дженнифер	Лопес	1969-07-24	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Jennifer_Lopez_at_the_2025_Sundance_Film_Festival_%28cropped_3%29.jpg/250px-Jennifer_Lopez_at_the_2025_Sundance_Film_Festival_%28cropped_3%29.jpg	\N
694	Кеке	Палмер	1993-08-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Keke_Palmer_at_Essence_Festival_of_Culture_2025_cropped.jpg/250px-Keke_Palmer_at_Essence_Festival_of_Culture_2025_cropped.jpg	\N
696	Кейт	Хадсон	1979-04-19	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Kate_Hudson_at_the_2024_Toronto_International_Film_Festival_%28cropped_2%29.jpg/250px-Kate_Hudson_at_the_2024_Toronto_International_Film_Festival_%28cropped_2%29.jpg	\N
697	Аамир	Хан	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Aamir_Khan_at_the_success_bash_of_Secret_Superstar.jpg/250px-Aamir_Khan_at_the_success_bash_of_Secret_Superstar.jpg	\N
705	Тимоти	Олифант	1968-05-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Timothy_Olyphant_in_2025_by_Gage_Skidmore.jpg/250px-Timothy_Olyphant_in_2025_by_Gage_Skidmore.jpg	\N
707	Сисси	Спейсек	1949-12-25	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Sissy_Spacek_by_David_Shankbone_%28cropped%29.jpg/250px-Sissy_Spacek_by_David_Shankbone_%28cropped%29.jpg	\N
710	Клэр	Фой	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Claire_Foy_on_the_Green_Carpet_at_the_2025_Zurich_Film_Festival_20_%28cropped%29.png/250px-Claire_Foy_on_the_Green_Carpet_at_the_2025_Zurich_Film_Festival_20_%28cropped%29.png	\N
711	Джейсон	Кларк	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Jason_Clarke_A_House_of_Dynamite-51_%28cropped%29.jpg/250px-Jason_Clarke_A_House_of_Dynamite-51_%28cropped%29.jpg	\N
713	Билли	Коннолли	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Billy_Connolly_Festival_Cine_Sidney.jpg/250px-Billy_Connolly_Festival_Cine_Sidney.jpg	\N
720	Роб	Корддри	1971-02-04	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Rob_Corddry_by_Gage_Skidmore.jpg/250px-Rob_Corddry_by_Gage_Skidmore.jpg	\N
724	Нэт	Вольф	1994-12-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Nat_Wolff_by_Gage_Skidmore.jpg/250px-Nat_Wolff_by_Gage_Skidmore.jpg	\N
671	Элизабет	Мох	1982-07-24	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Square_01_%2837062396652%29_%28cropped%29.jpg/250px-Square_01_%2837062396652%29_%28cropped%29.jpg	США
672	Зази	Битц	1991-06-01	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Zazie_Beetz_by_Gage_Skidmore_%28cropped%29.jpg/250px-Zazie_Beetz_by_Gage_Skidmore_%28cropped%29.jpg	США
725	ЛаКит	Стэнфилд	1991-08-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Keith_Stanfield_by_Gage_Skidmore.jpg/250px-Keith_Stanfield_by_Gage_Skidmore.jpg	\N
726	Маргарет	Куэлли	1994-10-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Margaret_Qualley_at_the_2025_Cannes_Film_Festival_01.jpg/250px-Margaret_Qualley_at_the_2025_Cannes_Film_Festival_01.jpg	\N
728	Милена	Смит	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Goyas_2023_-_Sin_identificar_100.jpg/250px-Goyas_2023_-_Sin_identificar_100.jpg	\N
733	Гарри	Стили	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/HarryStylesWembley170623_%2865_of_93%29_%2852982678051%29_%28cropped_2%29.jpg/250px-HarryStylesWembley170623_%2865_of_93%29_%2852982678051%29_%28cropped_2%29.jpg	\N
739	Мануэль	Гарсия-Рульфо	1981-02-25	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Manuel_Garcia-Rulfo_at_the_2024_Toronto_International_Film_Festival_%28Cropped%29.jpg/250px-Manuel_Garcia-Rulfo_at_the_2024_Toronto_International_Film_Festival_%28Cropped%29.jpg	\N
742	Ким	А Чжун	1982-10-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Kim_Ah-joong_in_April_2020.png/250px-Kim_Ah-joong_in_April_2020.png	\N
747	Нацуки	Ханаэ	1991-06-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Natsuki_Hanae_by_Gage_Skidmore.jpg/250px-Natsuki_Hanae_by_Gage_Skidmore.jpg	\N
749	Ёсицугу	Мацуока	1986-09-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Yoshitsugu_Matsuoka_%E6%9D%BE%E5%B2%A1_%E7%A6%8E%E4%B8%9E_2022.jpg/250px-Yoshitsugu_Matsuoka_%E6%9D%BE%E5%B2%A1_%E7%A6%8E%E4%B8%9E_2022.jpg	\N
750	Леди	Гага	1986-03-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Lady_Gaga_at_Joe_Biden%27s_inauguration_%28cropped_5%29.jpg/250px-Lady_Gaga_at_Joe_Biden%27s_inauguration_%28cropped_5%29.jpg	\N
752	Молли	Шеннон	1964-09-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/MollyShannon_2023_%28cropped-J1%29.jpg/250px-MollyShannon_2023_%28cropped-J1%29.jpg	\N
754	Джонни	Ноксвилл	1971-03-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Johnny-Knoxville.jpg/250px-Johnny-Knoxville.jpg	\N
756	Крис	Понтий	1974-07-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Chris-Pontius_TonsOfRock-2025-7.jpg/250px-Chris-Pontius_TonsOfRock-2025-7.jpg	\N
773	Джек	Дилан Грейзер	2003-09-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Jack_Dylan_Grazer_by_Gage_Skidmore_4.jpg/250px-Jack_Dylan_Grazer_by_Gage_Skidmore_4.jpg	\N
777	Дейзи	Эдгар-Джонс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Daisy_Edgar-Jones_at_the_2024_Toronto_International_Film_Festival_%28close-up%29.jpg/250px-Daisy_Edgar-Jones_at_the_2024_Toronto_International_Film_Festival_%28close-up%29.jpg	\N
783	Сэди	Раковина	2002-04-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Sadie_Sink_%2843914734441%29.jpg/250px-Sadie_Sink_%2843914734441%29.jpg	\N
785	Таапси	Панну	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Taapsee_Pannu_in_March_2022.jpg/250px-Taapsee_Pannu_in_March_2022.jpg	\N
788	Зои	Кравиц	1988-12-01	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Zoe_Kravitz_2020_dvna_studio.jpg/250px-Zoe_Kravitz_2020_dvna_studio.jpg	\N
791	О'Ши	Джексон младший	1991-02-24	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/O%27Shea_Jackson_Jr._by_Gage_Skidmore.jpg/250px-O%27Shea_Jackson_Jr._by_Gage_Skidmore.jpg	\N
799	Джуди	Грир	1975-07-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Judy_Greer_%2846810958364%29_%28cropped%29.jpg/250px-Judy_Greer_%2846810958364%29_%28cropped%29.jpg	\N
801	Исса	Рэй	1985-01-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Issa_Rae%2C_producer%2C_writer%2C_and_actress%2C_at_SXSW_2025_01_%28cropped%29.jpg/250px-Issa_Rae%2C_producer%2C_writer%2C_and_actress%2C_at_SXSW_2025_01_%28cropped%29.jpg	\N
805	Райан	Эгголд	1984-08-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Ryan_Eggold_2009.jpg/250px-Ryan_Eggold_2009.jpg	\N
806	Джанет	Монтгомери	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Janet_Montgomery_%2816434591754%29_%28cropped%29.jpg/250px-Janet_Montgomery_%2816434591754%29_%28cropped%29.jpg	\N
738	Изабела	Мерсед	2001-07-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Isabela_Merced%2C_actor%2C_at_SXSW_2025_03_%28cropped%29.jpg/250px-Isabela_Merced%2C_actor%2C_at_SXSW_2025_03_%28cropped%29.jpg	США
740	Ма	Дон Сок	1971-03-01	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Don_Lee_by_Gage_Skidmore.jpg/250px-Don_Lee_by_Gage_Skidmore.jpg	США
755	Стив-О		1974-06-13	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Stephen_Glover_in_Hoover%2C_AL_on_June_24%2C_2024._Photo_by_Peter_Dzubay.png/250px-Stephen_Glover_in_Hoover%2C_AL_on_June_24%2C_2024._Photo_by_Peter_Dzubay.png	США
807	Фрима	Агьеман	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Freema_Agyeman_%2848460099371%29_%28cropped%29.jpg/250px-Freema_Agyeman_%2848460099371%29_%28cropped%29.jpg	\N
809	Дэйвид	Хеллениус	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/David_Hellenius.jpg/250px-David_Hellenius.jpg	\N
810	Томас	Ледин	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Tomas_Ledin_%2814871185642%29.jpg/250px-Tomas_Ledin_%2814871185642%29.jpg	\N
819	Брендан	Галль	1978-09-02	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Brendan_Gall%2C_Shawn_Myrick%2C_Rob_Scarborough.jpg/250px-Brendan_Gall%2C_Shawn_Myrick%2C_Rob_Scarborough.jpg	\N
828	Мэнди	Патинкин	1952-11-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/MandyPatinkin.jpg/250px-MandyPatinkin.jpg	\N
834	Джеффри	Райт	1965-12-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Jeffrey_Wright-7706.jpg/250px-Jeffrey_Wright-7706.jpg	\N
835	Дакота	Фаннинг	1994-02-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Dakota_Fanning_SAG_AWARDS_2020.jpg/250px-Dakota_Fanning_SAG_AWARDS_2020.jpg	\N
840	Джульетта	Райлэнс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Juliet_Rylance_at_the_74th_Annual_Peabody_Awards.jpg/250px-Juliet_Rylance_at_the_74th_Annual_Peabody_Awards.jpg	\N
813	Марк	Уолберг	1971-06-05	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Mark_Wahlberg_2021.jpg/250px-Mark_Wahlberg_2021.jpg	\N
827	Клэр	Датчс	1979-04-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Claire_Danes_in_2015.jpg/250px-Claire_Danes_in_2015.jpg	\N
833	Дженис	Янг	1957-06-17	1973-06-09	https://upload.wikimedia.org/wikipedia/en/f/f7/Janice_Young.jpg	\N
814	Мила	Кунис	1983-08-14	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Mila_Kunis_TIFF_2025_%28cropped%29.jpg/250px-Mila_Kunis_TIFF_2025_%28cropped%29.jpg	США
\.


--
-- TOC entry 4929 (class 0 OID 16526)
-- Dependencies: 222
-- Data for Name: directing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directing (id_directing, id_movie, id_director) FROM stdin;
1	111161	1
2	68646	2
3	71562	2
4	468569	3
5	50083	4
6	108052	5
7	167260	6
8	110912	7
9	60196	8
10	137523	9
11	120737	6
12	80684	10
13	109830	11
14	1375666	3
15	167261	6
16	88763	11
17	133093	12
18	133093	13
19	99685	14
20	73486	15
21	47478	16
22	114369	9
23	38650	17
24	102926	18
25	27977	19
26	54215	20
27	82971	5
28	95327	21
29	114814	22
30	180093	23
31	209144	3
32	76759	24
33	86190	25
34	95765	26
35	103064	27
36	112573	28
37	114709	29
38	119217	30
39	120586	31
40	120689	1
41	120815	5
42	145487	32
43	172495	33
44	198781	34
45	198781	35
46	198781	36
47	241527	37
48	268978	38
49	298148	39
50	298148	40
51	298148	41
52	317705	42
53	330373	43
54	371746	44
55	373889	45
56	405159	46
57	449088	47
58	482571	3
59	758758	48
60	892769	49
61	892769	50
62	944835	51
63	974015	52
64	988045	53
65	1013752	54
66	1045658	55
67	1074638	56
68	1130884	14
69	1201607	45
70	1392170	57
71	1392190	58
72	1403865	59
73	1403865	60
74	1431045	61
75	1446714	33
76	1469304	62
77	1477834	63
78	1485796	64
79	1490017	65
80	1490017	66
81	1560747	67
82	1568911	5
83	1587310	68
84	1628841	69
85	1631867	70
86	1637688	71
87	1655442	72
88	1661199	73
89	1673434	74
90	1683526	31
91	1707386	75
92	1727824	22
93	1731141	76
94	1742044	46
95	1764651	77
96	1772341	78
97	1781769	79
98	1790864	80
99	1798709	81
100	1800302	82
101	1825683	83
102	1840309	84
103	1856101	85
104	1877832	22
105	1895587	86
106	1951264	87
107	1951265	87
108	1979320	38
109	1981677	88
110	2005151	89
111	2025690	90
112	2042568	59
113	2042568	60
114	2072233	91
115	2096673	34
116	2096673	92
117	2103281	93
118	2119532	28
119	2140479	94
120	2179136	46
121	2267998	9
122	2278871	95
123	2293640	96
124	2293640	97
125	2304933	98
126	2310332	6
127	2322441	99
128	2334873	100
129	2345759	101
130	2379713	56
131	2381249	102
132	2395427	103
133	2404435	104
134	2488496	105
135	2527336	106
136	2543472	107
137	2582782	108
138	2584384	109
139	2674426	110
140	2709768	111
141	2763304	112
142	2788710	113
143	2788710	114
144	2802144	115
145	2820852	63
146	2872718	116
147	2948356	117
148	2948356	78
149	2948356	118
150	2975590	52
151	2980516	119
152	3011894	120
153	3040964	44
154	3065204	63
155	3076658	83
156	3110958	121
157	3170832	122
158	3183660	45
159	3263904	46
160	3315342	123
161	3385516	22
162	3393786	124
163	3470600	125
164	3470600	126
165	3498820	127
166	3498820	128
167	3521164	129
168	3521164	130
169	3521164	131
170	3553976	132
171	3606756	42
172	3640424	11
173	3659388	33
174	3661394	110
175	3682448	5
176	3731562	133
177	3741700	134
178	3778644	38
179	3783958	135
180	3896198	136
181	3899154	137
182	3899154	138
183	3899154	139
184	3908142	140
185	4016934	141
186	4034228	142
187	4046784	80
188	4062536	143
189	4116284	144
190	4154756	127
191	4154756	128
192	4154796	127
193	4154796	128
194	4169250	145
195	4178092	146
196	4196776	147
197	4218572	148
198	4281724	149
199	4348012	150
200	4425200	151
201	4437640	152
202	4463894	153
203	4477536	154
204	4550098	155
205	4575576	156
206	4622512	157
207	4622512	158
208	4633694	159
209	4633694	160
210	4633694	161
211	4669788	162
212	4701182	163
213	4779682	164
214	4846340	165
215	4975722	166
216	5013056	3
217	5027774	167
218	5052448	168
219	5073642	169
220	5095030	170
221	5113040	111
222	5113040	171
223	5164214	57
224	5164432	172
225	5186714	173
226	5323662	174
227	5463162	175
228	5580390	176
229	5726616	177
230	5814060	178
231	5884052	179
232	6139732	53
233	6320628	180
234	6450804	61
235	6644200	181
236	6751668	182
237	6857112	168
238	6966692	183
239	7131622	7
240	7286456	89
241	7349662	184
242	7653254	185
243	7775622	186
244	7775622	187
245	7979580	188
246	7979580	189
247	8079248	112
248	8115900	190
249	8267604	191
250	8328716	192
251	8367814	53
252	8772262	193
253	8946378	106
254	8970448	194
255	9032400	195
256	9243804	196
257	9376612	197
258	9419884	32
259	9770150	195
260	10223460	198
261	10366206	151
262	10648342	109
263	10872600	180
264	10954984	168
265	11286314	199
266	11564570	106
267	1160419	85
268	1166100	200
269	1170358	6
270	1178665	201
272	1190080	69
273	1192628	47
274	1193138	203
275	1193631	121
276	1194173	204
277	1194263	205
278	1194606	206
279	1196134	207
280	1196948	208
281	1197624	209
282	1197628	210
283	1205489	46
284	1210166	211
285	1211837	212
286	1213641	135
287	1217209	213
288	1217209	214
289	1217209	215
290	1219827	216
291	1220634	217
292	1220719	218
293	1228705	44
294	1231587	219
295	1232829	65
296	1232829	66
297	1234721	220
298	1235166	221
299	1241317	222
300	12618926	223
301	14039582	224
302	10954600	170
303	10304142	55
304	10731256	225
305	1067106	11
307	10731768	227
308	10726604	228
310	11032374	230
311	11138512	231
312	11214590	33
313	11388406	232
314	11466222	233
316	11671006	235
318	11866324	236
320	12004038	237
321	12361974	52
322	12412888	238
323	12731980	239
324	12801262	240
325	12921446	241
329	13143964	245
331	13320622	246
332	13320622	247
333	13403046	248
334	13521006	193
335	13634480	249
336	13634480	250
337	13833688	23
338	14042066	251
339	14128670	252
340	14209916	253
342	1454029	254
343	1462764	123
345	17663992	255
346	17663992	256
\.


--
-- TOC entry 4927 (class 0 OID 16480)
-- Dependencies: 220
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (id_director, first_name, second_name, date_birth, date_death, director_photo, director_country) FROM stdin;
31	Тони	Кэй	\N	\N	\N	\N
35	Дэйвид	Сильверман	\N	\N	\N	\N
37	Крис	Колумбус	\N	\N	\N	\N
43	Майк	Ньюэлл	\N	\N	\N	\N
74	Билл	Кондон	1955-10-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Bill_Condon_at_the_2025_Sundance_Film_Festival_%28cropped%29.jpg/250px-Bill_Condon_at_the_2025_Sundance_Film_Festival_%28cropped%29.jpg	\N
58	Джордж	Миллер	\N	\N	\N	\N
163	Трэвис	Найт	1973-09-13	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Travis_Knight_%2830000495292%29.jpg/250px-Travis_Knight_%2830000495292%29.jpg	\N
61	Тим	Миллер	\N	\N	\N	\N
66	Кристофер	Миллер	\N	\N	\N	\N
77	Саймон	Запад	\N	\N	\N	\N
186	Джимми	Чин	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Jimmy_Chin_Spoke_at_University_of_Michigan.jpg/250px-Jimmy_Chin_Spoke_at_University_of_Michigan.jpg	\N
86	Том	Маккарти	\N	\N	\N	\N
88	Джейсон	Мур	\N	\N	\N	\N
94	Гэвин	О'Коннор	\N	\N	\N	\N
208	Фредрик	Линк	\N	\N	\N	\N
108	Дэйвид	Маккензи	\N	\N	\N	\N
119	Джеймс	Марш	\N	\N	\N	\N
213	Марк	Эндрюс	\N	\N	\N	\N
126	Кристоф	Лурделе	\N	\N	\N	\N
127	Энтони	Руссо	\N	\N	\N	\N
128	Джо	Руссо	\N	\N	\N	\N
219	Стив	Пинк	1966-02-03	\N	\N	\N
131	Дон	Зал	\N	\N	\N	\N
228	Ён Хо	Сон	\N	\N	\N	\N
1	Френк	Дарабонт	1959-01-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Frank_Darabont_at_the_PaleyFest_2011_-_The_Walking_Dead_panel.jpg/250px-Frank_Darabont_at_the_PaleyFest_2011_-_The_Walking_Dead_panel.jpg	США
4	Сидни	Люмет	1924-06-25	2011-04-09	https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Sidney_Lumet_1970.jpg/250px-Sidney_Lumet_1970.jpg	США
132	Мэтт	Росс	\N	\N	\N	\N
137	Фил	Гидри	\N	\N	\N	\N
150	Джо	Линч	\N	\N	\N	\N
154	Джеймс	Фоли	\N	\N	\N	\N
10	Ирвин	Кершнер	1923-04-29	2010-11-27	https://upload.wikimedia.org/wikipedia/en/f/f7/Irvin_Kershner.jpg	\N
18	Джонатан	Демме	1944-02-22	2017-04-26	https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Jonathan_Demme_%28May_2015_small%29.JPG/250px-Jonathan_Demme_%28May_2015_small%29.JPG	\N
25	Ричард	Маркванд	\N	\N	https://upload.wikimedia.org/wikipedia/en/b/ba/RichardMarquand.gif	\N
33	Ридли	Скотт	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Ridley_Scott_by_Gage_Skidmore.jpg/250px-Ridley_Scott_by_Gage_Skidmore.jpg	\N
39	Эндрю	Адамсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/1/1a/Andrew_Adamson_%28cropped%29.jpg	\N
41	Конрад	Вернон	1968-07-11	\N	\N	\N
42	Брэд	Птица	1957-09-24	\N	https://upload.wikimedia.org/wikipedia/commons/3/3a/Brad_bird_cropped_2009.jpg	\N
47	Гор	Вербински	1964-03-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Verbinski_gore.jpg/250px-Verbinski_gore.jpg	\N
51	Филипп	Нойс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Phillip_Noyce_by_Gage_Skidmore.jpg/250px-Phillip_Noyce_by_Gage_Skidmore.jpg	\N
55	Дэйвид	О. Рассел	1958-08-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/David_O._Russell_avp_2014.jpg/250px-David_O._Russell_avp_2014.jpg	\N
189	Джефф	Роу	\N	\N	\N	\N
76	Гэвин	Худ	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Gavin_Hood_2015.jpg/250px-Gavin_Hood_2015.jpg	\N
57	Гэри	Росс	1956-11-03	\N	\N	\N
70	Дуг	Лиман	1965-07-24	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Doug_Liman_avp_2014.jpg/250px-Doug_Liman_avp_2014.jpg	\N
73	Кеннет	Брана	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Kenneth_Branagh_at_diff_2015.jpg/250px-Kenneth_Branagh_at_diff_2015.jpg	\N
82	Стивен	Гаган	1965-05-06	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Stephen_Gaghan_%28cropped%29.jpg/250px-Stephen_Gaghan_%28cropped%29.jpg	\N
84	Нил	Бургер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Neil_Burger.png/250px-Neil_Burger.png	\N
90	Крейг	Гиллеспи	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Craig_Gillespie_%28cropped%29.jpg/250px-Craig_Gillespie_%28cropped%29.jpg	\N
96	Кайл	Балда	1971-03-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Kyle_Balda_2015_AIAFF.jpg/250px-Kyle_Balda_2015_AIAFF.jpg	\N
99	Сэм	Тейлор-Джонсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/d/df/Sam_Taylor-Wood_%26_Aaron_Johnson_%28cropped%29.jpg	\N
103	Джосс	Уидон	1964-06-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Joss_Whedon_by_Gage_Skidmore_8.jpg/250px-Joss_Whedon_by_Gage_Skidmore_8.jpg	\N
109	Тайка	Вайтити	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Taika_Waititi_photo_by_pouria_afkhami.jpg/250px-Taika_Waititi_photo_by_pouria_afkhami.jpg	\N
111	Крис	Рено	\N	\N	https://upload.wikimedia.org/wikipedia/commons/2/2c/Chris_Renaud.jpg	\N
80	Уэс	Мяч	1980-10-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Wes_Ball_by_Gage_Skidmore.jpg/250px-Wes_Ball_by_Gage_Skidmore.jpg	\N
81	Шип	Джонз	1969-10-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Spike_Jonze_Her_Premiere_NYFF_2013_%28cropped%29.jpg/250px-Spike_Jonze_Her_Premiere_NYFF_2013_%28cropped%29.jpg	\N
83	Райан	Куглер	1986-05-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Ryan_Coogler_%2836203771036%29_2.jpg/250px-Ryan_Coogler_%2836203771036%29_2.jpg	\N
85	Денис	Вильнёв	1967-10-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/DVilleneuveRFH121024_%2812_of_23%29_%2854061976489%29_%28cropped%29.jpg/250px-DVilleneuveRFH121024_%2812_of_23%29_%2854061976489%29_%28cropped%29.jpg	\N
140	Анна	Биллер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Anna_Biller.jpg/250px-Anna_Biller.jpg	\N
145	Нирадж	Панди	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Neeraj_Pandey_IIT_Mumbai.jpg/250px-Neeraj_Pandey_IIT_Mumbai.jpg	\N
146	Джоэл	Эджертон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Joel_Edgerton_in_2017.jpg/250px-Joel_Edgerton_in_2017.jpg	\N
147	Пол	Гринграсс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Paul_Greengrass_at_the_2025_Toronto_International_Film_Festival.jpg/250px-Paul_Greengrass_at_the_2025_Toronto_International_Film_Festival.jpg	\N
215	Стив	Перселл	1961-07-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Steve_Purcell_GDC_08.jpg/250px-Steve_Purcell_GDC_08.jpg	\N
216	Руперт	Сандерс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Rupert_Sanders_%287400890660%29_%28cropped%29.jpg/250px-Rupert_Sanders_%287400890660%29_%28cropped%29.jpg	\N
217	Пол	В.С. Андерсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Paul_W._S._Anderson_by_Gage_Skidmore.jpg/250px-Paul_W._S._Anderson_by_Gage_Skidmore.jpg	\N
69	Роланд	Эммерих	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Independence_Day-_Resurgence_Japan_Premiere-_Roland_Emmerich_%2828502013341%29_CROPPED.jpg/250px-Independence_Day-_Resurgence_Japan_Premiere-_Roland_Emmerich_%2828502013341%29_CROPPED.jpg	США
75	Том	Хупер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/TomHopper10TIFF.jpg/250px-TomHopper10TIFF.jpg	Великобритания
78	Рич	Мур	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Rich_Moore.jpg/250px-Rich_Moore.jpg	США
87	Фрэнсис	Лоуренс	1971-03-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Francis_Lawrence_by_Gage_Skidmore_2.jpg/250px-Francis_Lawrence_by_Gage_Skidmore_2.jpg	США
91	Баран	Бо Одар	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/AV0A2925_Jantje_Friese_und_Baran_bo_Odar_%28Dark%29_%28cropped%292.jpg/250px-AV0A2925_Jantje_Friese_und_Baran_bo_Odar_%28Dark%29_%28cropped%292.jpg	Германия
95	Абдельлатиф	Кечиче	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Abdellatif_Kechiche_Cannes_2013.jpg/250px-Abdellatif_Kechiche_Cannes_2013.jpg	Франция
114	Сет	Роген	1982-04-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Seth_Rogen_-_Good_Fortune_LA_Premiere.jpg/250px-Seth_Rogen_-_Good_Fortune_LA_Premiere.jpg	США
135	Дэмиен	Шазель	1985-01-19	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Damien_Chazelle_%28cropped%29.jpg/250px-Damien_Chazelle_%28cropped%29.jpg	США
156	Марк	Форстер	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Marc_Forster_Cannes_2013.jpg/250px-Marc_Forster_Cannes_2013.jpg	Германия
162	Мими	Ледер	1952-01-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Mimi_Leder%2C_May_2016_%281%29.jpg/250px-Mimi_Leder%2C_May_2016_%281%29.jpg	США
167	Мартин	МакДонах	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/BansheesBFI131022_%2816_of_22%29_%2852447800201%29_%28Martin_McDonagh%29.jpg/250px-BansheesBFI131022_%2816_of_22%29_%2852447800201%29_%28Martin_McDonagh%29.jpg	Великобритания
225	Оливия	Уайльд	1984-03-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Olivia_Wilde_in_2022.jpg/250px-Olivia_Wilde_in_2022.jpg	США
230	Харуо	Сотодзаки	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Haruo_Sotozaki_by_Gage_Skidmore.jpg/250px-Haruo_Sotozaki_by_Gage_Skidmore.jpg	Япония
115	Мэтью	Вон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Matthew_Vaughn_%2848017198166%29_CROPPED.jpg/250px-Matthew_Vaughn_%2848017198166%29_CROPPED.jpg	\N
122	Ленни	Абрахамсон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Lenny_Abrahamson_-_2024.jpg/250px-Lenny_Abrahamson_-_2024.jpg	\N
125	Гарт	Дженнингс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/2008-0419-GarthJennings.jpg/250px-2008-0419-GarthJennings.jpg	\N
139	Дэйвид	Уилан	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Dave_whelan_cropped.jpg/250px-Dave_whelan_cropped.jpg	\N
143	Джереми	Солнье	1976-06-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Jeremy_Saulnier_Deauville_2013.jpg/250px-Jeremy_Saulnier_Deauville_2013.jpg	\N
148	Стив	Маккуин	1930-03-24	1980-11-07	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Steve-McQueen-1968_%28cropped%29.jpg/250px-Steve-McQueen-1968_%28cropped%29.jpg	\N
152	Бутч	Лукич	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/DC_Comics_2024.svg/250px-DC_Comics_2024.svg.png	\N
157	Джонатан	Дейтон	1760-10-16	1824-10-09	https://upload.wikimedia.org/wikipedia/commons/e/ee/JDayton.jpg	\N
161	Родни	Ротман	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Rodney_Rothman_by_Gage_Skidmore.jpg/250px-Rodney_Rothman_by_Gage_Skidmore.jpg	\N
165	Теодор	Мелфи	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Theodore_Melfi_%28cropped%29.jpg/250px-Theodore_Melfi_%28cropped%29.jpg	\N
174	Наоко	Ямада	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Naoko_Yamada_signature.svg/250px-Naoko_Yamada_signature.svg.png	\N
177	Лука	Гуаданьино	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Luca_Guadagnino-63112.jpg/250px-Luca_Guadagnino-63112.jpg	\N
180	Джон	Уоттс	1981-06-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Jon_Watts_by_Gage_Skidmore_2.jpg/250px-Jon_Watts_by_Gage_Skidmore_2.jpg	\N
169	Ричард	Стэнли	\N	\N	\N	\N
171	Джонатан	дель Валь	\N	\N	\N	\N
185	Ной	Баумбах	1969-09-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Noah_Baumbach_Jay_Kelly-49.jpg/250px-Noah_Baumbach_Jay_Kelly-49.jpg	\N
196	Дэйвид	Лоури	\N	\N	\N	\N
198	Кэт	Койро	\N	\N	\N	\N
202	Майкл	Броснан	\N	\N	\N	\N
227	Брайан	Эндрю Мендоса	\N	\N	\N	\N
229	Шадаб	Сиддики	\N	\N	\N	\N
235	Патрик	Хьюз	\N	\N	\N	\N
237	Хлоя	Окуно	\N	\N	\N	\N
239	Потси	Пончироли	\N	\N	\N	\N
243	Ананд	Сагар	\N	\N	\N	\N
244	Моти	Сагар	\N	\N	\N	\N
249	Маршалл	Фелс Эллиотт	\N	\N	\N	\N
250	Джон	К. Донкин	\N	\N	\N	\N
254	Тейт	Тейлор	\N	\N	\N	\N
2	Фрэнсис	Форд Коппола	1939-04-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Francis_Ford_Coppola_on_December_8%2C_2024_in_the_White_House_Oval_Office_%28cropped%29.jpg/250px-Francis_Ford_Coppola_on_December_8%2C_2024_in_the_White_House_Oval_Office_%28cropped%29.jpg	\N
9	Дэйвид	Финчер	1962-08-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/TheKillerBFILFF051023_%288_of_22%29_%2853255176376%29_%28cropped2%29.jpg/250px-TheKillerBFILFF051023_%288_of_22%29_%2853255176376%29_%28cropped2%29.jpg	\N
11	Роберт	Земекис	1952-05-14	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Robert_Zemeckis_%22The_Walk%22_at_Opening_Ceremony_of_the_28th_Tokyo_International_Film_Festival_%2821835891403%29_%28cropped%29.jpg/250px-Robert_Zemeckis_%22The_Walk%22_at_Opening_Ceremony_of_the_28th_Tokyo_International_Film_Festival_%2821835891403%29_%28cropped%29.jpg	\N
12	Лана	Вачовски	1965-06-21	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Lana_Wachowski-2787_%283x4_cropped%29.jpg/250px-Lana_Wachowski-2787_%283x4_cropped%29.jpg	\N
13	Лилли	Вачовски	1965-06-21	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Lana_Wachowski-2787_%283x4_cropped%29.jpg/250px-Lana_Wachowski-2787_%283x4_cropped%29.jpg	\N
170	Пейтон	Рид	1964-07-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Peyton_Reed_%28cropped%29.jpg/250px-Peyton_Reed_%28cropped%29.jpg	\N
188	Майкл	Рианда	1984-12-25	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Mike_Rianda_2021.png/250px-Mike_Rianda_2021.png	\N
192	Тони	Джильо	1971-06-03	\N	\N	\N
194	Логан	Маршалл-Грин	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Logan-Marshall-Interview.jpg/250px-Logan-Marshall-Interview.jpg	\N
200	А.Р.	Муругадосс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Murugadoss.jpg/250px-Murugadoss.jpg	\N
205	Аарон	Шнайдер	1965-07-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Aaron_Schneider_Get_Low_TIFF09_cropped.jpg/250px-Aaron_Schneider_Get_Low_TIFF09_cropped.jpg	\N
206	Рекс	Фортепиано	1955-09-01	\N	\N	\N
210	Джоди	Холм	1976-10-15	\N	\N	\N
214	Бренда	Чепмен	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Brenda_Chapman_at_JDIFF_2012.jpg/250px-Brenda_Chapman_at_JDIFF_2012.jpg	\N
218	Уилсон	Йип	\N	\N	https://upload.wikimedia.org/wikipedia/commons/1/10/Wilson_Yip_at_premiere_of_Killzone.jpg	\N
221	Жак	Одиар	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Jacques_Audiard_Cannes_2017.jpg/250px-Jacques_Audiard_Cannes_2017.jpg	\N
232	Джефф	Баэна	1977-06-29	2025-01-03	https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Jeff_Baena.jpg/250px-Jeff_Baena.jpg	\N
238	Джефф	Фаулер	1978-07-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Jeff-fowler-2.png/250px-Jeff-fowler-2.png	\N
242	Рамананд	Сагар	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Ramanand_Saagar.jpg/250px-Ramanand_Saagar.jpg	\N
118	Джаред	Буш	1974-06-12	\N	\N	\N
153	Тим	Стори	1970-03-13	\N	\N	\N
246	Аарон	Нии	\N	\N	\N	\N
247	Адам	Нии	\N	\N	\N	\N
248	Мими	Кэйв	\N	\N	\N	\N
253	Элизабет	Банки	1974-02-10	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Elizabeth_Banks_during_interview_in_2019.png/250px-Elizabeth_Banks_during_interview_in_2019.png	\N
26	Джузеппе	Торнаторе	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Giuseppe_Tornatore.jpg/250px-Giuseppe_Tornatore.jpg	\N
29	Джон	Лассетер	1957-01-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/JohnLasseterOct2011.jpg/250px-JohnLasseterOct2011.jpg	\N
30	Гас	Ван Сант	1952-07-24	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Gus_Van_Sant_at_82nd_Venice_International_Film_Festival-1.jpg/250px-Gus_Van_Sant_at_82nd_Venice_International_Film_Festival-1.jpg	\N
32	Сэм	Рэйми	1959-10-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Sam_Raimi_Photo_Op_GalaxyCon_Raleigh_2024_%28cropped%29.jpg/250px-Sam_Raimi_Photo_Op_GalaxyCon_Raleigh_2024_%28cropped%29.jpg	\N
34	Пит	Доктер	1968-10-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Pete_Docter_cropped_2009.jpg/250px-Pete_Docter_cropped_2009.jpg	\N
36	Ли	Ункрич	1967-08-08	\N	https://upload.wikimedia.org/wikipedia/commons/0/05/Lee_Unkrich_cropped_2009.jpg	\N
38	Рон	Ховард	1954-03-01	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Ron_Howard_at_the_2024_Toronto_International_Film_Festival_05_%28cropped%29.jpg/250px-Ron_Howard_at_the_2024_Toronto_International_Film_Festival_05_%28cropped%29.jpg	\N
40	Келли	Эсбери	1960-01-15	2020-06-26	https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Kelly_Asbury_Photo_Select_%28cropped%29.jpg/250px-Kelly_Asbury_Photo_Select_%28cropped%29.jpg	\N
44	Джон	Фавро	1966-10-19	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Jon_Favreau_2016.jpeg/250px-Jon_Favreau_2016.jpeg	\N
45	Дэйвид	Йейтс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/David_Yates_by_Gage_Skidmore.jpg/250px-David_Yates_by_Gage_Skidmore.jpg	\N
46	Клинт	Иствуд	1930-05-31	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Clint_Eastwood_visits_MCB_Camp_Pendleton_%281%29_%28cropped%29.jpg/250px-Clint_Eastwood_visits_MCB_Camp_Pendleton_%281%29_%28cropped%29.jpg	\N
48	Шон	Пенн	1960-08-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Superpower_%282023%29-60523_%28cropped%29.jpg/250px-Superpower_%282023%29-60523_%28cropped%29.jpg	\N
49	Дин	ДеБлуа	1970-06-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Dean_DeBlois%2C_2014_WonderCon-3.jpg/250px-Dean_DeBlois%2C_2014_WonderCon-3.jpg	\N
50	Крис	Сандерс	1962-03-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Chris_Sanders%2C_Golden_Globes_2014_%28crop%29.jpg/250px-Chris_Sanders%2C_Golden_Globes_2014_%28crop%29.jpg	\N
52	Зак	Снайдер	1966-03-01	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Zack_Snyder_by_Gage_Skidmore_2.jpg/250px-Zack_Snyder_by_Gage_Skidmore_2.jpg	\N
54	Джастин	Лин	1971-10-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Justin_Lin_at_the_2025_Sundance_Film_Festival_%28cropped%29.jpg/250px-Justin_Lin_at_the_2025_Sundance_Film_Festival_%28cropped%29.jpg	\N
56	Сэм	Мендес	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Sam_Mendes_in_2022-2.jpg/250px-Sam_Mendes_in_2022-2.jpg	\N
59	Итан	Коэн	1957-09-21	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Ethan_Coen_%28Berlin_Film_Festival_2011%29.jpg/250px-Ethan_Coen_%28Berlin_Film_Festival_2011%29.jpg	\N
60	Джоэл	Коэн	1954-11-29	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Joel_Coen_-_Berlin_Berlinale_66_%2824950127406%29_%28cropped%29.jpg/250px-Joel_Coen_-_Berlin_Berlinale_66_%2824950127406%29_%28cropped%29.jpg	\N
62	Сет	Гордон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Seth_Gordon_at_PaleyFest_Fall_TV_Previews_2014.jpg/250px-Seth_Gordon_at_PaleyFest_Fall_TV_Previews_2014.jpg	\N
64	Майкл	Грейси	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Michael_Gracey_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg/250px-Michael_Gracey_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg	\N
65	Фил	Господин	1975-07-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Christopher_Miller_and_Phil_Lord_by_Gage_Skidmore.jpg/330px-Christopher_Miller_and_Phil_Lord_by_Gage_Skidmore.jpg	\N
67	Пол	Томас Андерсон	1970-06-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Paul_Thomas_Anderson_2022_%282%29_%28cropped%29.jpg/250px-Paul_Thomas_Anderson_2022_%282%29_%28cropped%29.jpg	\N
68	Роберт	Стромберг	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Gerry_with_Robert_Stromberg.jpg/250px-Gerry_with_Robert_Stromberg.jpg	\N
71	Эндрю	Никкол	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Andrew_Niccol_by_Gage_Skidmore.jpg/250px-Andrew_Niccol_by_Gage_Skidmore.jpg	\N
72	Мишель	Хазанавичюс	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Michel_Hazanavicius_2022_%28cropped%29.jpg/250px-Michel_Hazanavicius_2022_%28cropped%29.jpg	\N
79	Джо	Райт	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Joe_Wright_by_Gage_Skidmore.jpg/250px-Joe_Wright_by_Gage_Skidmore.jpg	\N
89	Тодд	Филлипс	1970-12-19	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Todd_Phillips-64847.jpg/250px-Todd_Phillips-64847.jpg	\N
92	Ронни	Дель Кармен	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/20140806RonnieDelCarmen03.jpg/250px-20140806RonnieDelCarmen03.jpg	\N
93	Мэтт	Ривз	1966-04-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Matt_Reeves_%2813948765595%29_%28cropped%29.jpg/250px-Matt_Reeves_%2813948765595%29_%28cropped%29.jpg	\N
97	Пьер	Гроб	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Pierre_Coffin_2017.jpg/250px-Pierre_Coffin_2017.jpg	\N
98	Дж	Блейксон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/J_Blakeson_%285458166087%29_%28cropped%29.jpg/250px-J_Blakeson_%285458166087%29_%28cropped%29.jpg	\N
100	Вуди	Аллен	1935-11-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Woody_Allen_Cannes_2016.jpg/250px-Woody_Allen_Cannes_2016.jpg	\N
53	Гай	Ричи	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/GuyRitchiebyKathyHutchins.jpg/250px-GuyRitchiebyKathyHutchins.jpg	\N
5	Стивен	Спилберг	1946-12-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/MKr25402_Steven_Spielberg_%28Berlinale_2023%29_%283x4_cropped%29.jpg/250px-MKr25402_Steven_Spielberg_%28Berlinale_2023%29_%283x4_cropped%29.jpg	США
101	Алекс	Курцман	1973-09-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Alex_Kurtzman_San_Diego_Comic_Con_2019.jpg/250px-Alex_Kurtzman_San_Diego_Comic_Con_2019.jpg	\N
102	Кристофер	МакКуорри	1968-10-25	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Christopher_McQuarrie_at_the_2025_Cannes_Film_Festival_05.jpg/250px-Christopher_McQuarrie_at_the_2025_Cannes_Film_Festival_05.jpg	\N
104	Антуан	Фукуа	1965-05-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Antoine_Fuqua_%2829682821190%29.jpg/250px-Antoine_Fuqua_%2829682821190%29.jpg	\N
105	Джей Джей	Абрамс	1966-06-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/J._J._Abrams_San_Diego_Comic_Con_International_2015.jpg/250px-J._J._Abrams_San_Diego_Comic_Con_International_2015.jpg	\N
106	Райан	Джонсон	1973-12-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Rian_Johnson_TIFF_2025_%28cropped%29.jpg/250px-Rian_Johnson_TIFF_2025_%28cropped%29.jpg	\N
107	Стивен	Чбоски	1970-01-25	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stephen_Chbosky%2C_Jericho_Panel_at_Comic_Con_SD_2006_cropped.jpg/250px-Stephen_Chbosky%2C_Jericho_Panel_at_Comic_Con_SD_2006_cropped.jpg	\N
110	Тея	Шаррок	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Thea_Sharrock_in_2016_%28cropped%29.jpg/250px-Thea_Sharrock_in_2016_%28cropped%29.jpg	\N
112	Дэнни	Бойл	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Danny_Boyle_May_2019.jpg/250px-Danny_Boyle_May_2019.jpg	\N
113	Эван	Гольдберг	1982-09-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Evan_Goldberg_by_Gage_Skidmore.jpg/250px-Evan_Goldberg_by_Gage_Skidmore.jpg	\N
116	Дэн	Гилрой	1959-06-24	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Dan_Gilroy_-_Andor_2025.jpg/250px-Dan_Gilroy_-_Andor_2025.jpg	\N
120	Дамиан	Сифрон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Dami%C3%A1n_Szifron_%28cropped%29.jpg/250px-Dami%C3%A1n_Szifron_%28cropped%29.jpg	\N
121	Джон	М. Чу	1979-11-02	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Jon_Chu_at_LA_Book_Fest_2025_07_%28cropped%29.jpg/250px-Jon_Chu_at_LA_Book_Fest_2025_07_%28cropped%29.jpg	\N
123	Джеймс	Мангольд	1963-12-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/James_Mangold_Press_Conference_Logan_Berlinale_2017_03.jpg/250px-James_Mangold_Press_Conference_Logan_Berlinale_2017_03.jpg	\N
124	Эдвард	Цвик	1952-10-08	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Edward_Zwick_2016.jpg/250px-Edward_Zwick_2016.jpg	\N
129	Рон	Клементс	1953-04-25	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Ron_Clements_2.jpg/250px-Ron_Clements_2.jpg	\N
130	Джон	Маскер	1953-11-08	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/John_Musker_01.jpg/250px-John_Musker_01.jpg	\N
133	Иордания	Фогт-Робертс	1984-09-22	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Jordan_Vogt-Roberts_by_Gage_Skidmore.jpg/250px-Jordan_Vogt-Roberts_by_Gage_Skidmore.jpg	\N
134	Майкл	Догерти	1974-10-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Michael_Dougherty_at_Godzilla_Minus_One_US_premiere_%28cropped%29.png/250px-Michael_Dougherty_at_Godzilla_Minus_One_US_premiere_%28cropped%29.png	\N
136	Джеймс	Ганн	1966-08-05	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/James_Gunn_by_Gage_Skidmore_3.jpg/250px-James_Gunn_by_Gage_Skidmore_3.jpg	\N
138	Саймон	Герберт	\N	\N	https://upload.wikimedia.org/wikipedia/en/thumb/b/be/Flag_of_England.svg/40px-Flag_of_England.svg.png	\N
141	Парк	Чан Ук	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/20130925%E2%80%94Park_Chan-wook_%EB%B0%95%EC%B0%AC%EC%9A%B1_Marie_Claire_Korea_photo_shoot_screenshot_%2800m01s%29_%28cropped%29.jpg/250px-20130925%E2%80%94Park_Chan-wook_%EB%B0%95%EC%B0%AC%EC%9A%B1_Marie_Claire_Korea_photo_shoot_screenshot_%2800m01s%29_%28cropped%29.jpg	\N
142	Кеннет	Лонерган	1962-10-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Kenneth_Lonergan_Viennale_2016_opening_4_%28cropped%29.jpg/250px-Kenneth_Lonergan_Viennale_2016_opening_4_%28cropped%29.jpg	\N
144	Крис	Маккей	1973-11-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Chris_McKay_by_Gage_Skidmore.jpg/250px-Chris_McKay_by_Gage_Skidmore.jpg	\N
149	Дэмиен	Леоне	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Damien_Leone_Photo_Op_Animate_Nightmare_Weekend_Des_Moines_2024.jpg/250px-Damien_Leone_Photo_Op_Animate_Nightmare_Weekend_Des_Moines_2024.jpg	\N
151	Чад	Стахельски	1968-09-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Chad_Stahelski_-_Wick_is_Pain.jpg/250px-Chad_Stahelski_-_Wick_is_Pain.jpg	\N
155	Том	Форд	1961-08-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Tom_Ford_cropped_2009.jpg/250px-Tom_Ford_cropped_2009.jpg	\N
158	Валери	Фарис	1957-07-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Dayton_and_Faris.jpg/250px-Dayton_and_Faris.jpg	\N
159	Боб	Персичетти	1970-09-28	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Bob_Persichetti_by_Gage_Skidmore.jpg/250px-Bob_Persichetti_by_Gage_Skidmore.jpg	\N
160	Питер	Рэмси	1962-12-23	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Peter_Ramsey_by_Gage_Skidmore.jpg/250px-Peter_Ramsey_by_Gage_Skidmore.jpg	\N
164	Джон	Туртельтауб	1963-08-08	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/JonTurteltaubHWOFJan2013.jpg/250px-JonTurteltaubHWOFJan2013.jpg	\N
166	Барри	Дженкинс	1979-11-19	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Filmmaker_Barry_Jenkins_%28cropped%29.jpg/250px-Filmmaker_Barry_Jenkins_%28cropped%29.jpg	\N
168	Иордания	Пил	1979-02-21	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/SXSW_2019_2_-_Jordan_Peele_%2847282560202%29_%28cropped%29.jpg/250px-SXSW_2019_2_-_Jordan_Peele_%2847282560202%29_%28cropped%29.jpg	\N
172	Грег	Берланти	1972-05-24	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Greg_Berlanti_cropped.jpg/250px-Greg_Berlanti_cropped.jpg	\N
173	Асгар	Фархади	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Asghar_Farhadi_in_2018-2_%28cropped%29.jpg/250px-Asghar_Farhadi_in_2018-2_%28cropped%29.jpg	\N
175	Дэйвид	Лейтч	1975-11-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/David_Leitch_by_Gage_Skidmore_2.jpg/250px-David_Leitch_by_Gage_Skidmore_2.jpg	\N
117	Байрон	Ховард	1968-12-26	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Byron_Howard.jpg/250px-Byron_Howard.jpg	США
176	Гильермо	дель Торо	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Guilliermo_Del_Toro_at_82nd_Venice_International_Film_Festival.jpg/250px-Guilliermo_Del_Toro_at_82nd_Venice_International_Film_Festival.jpg	\N
178	Корин	Харди	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Corin_Hardy.jpg/250px-Corin_Hardy.jpg	\N
179	Роб	Леттерман	1970-10-31	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Rob_Letterman%2C_SDCC_2014-2_%28cropped%29.jpg/250px-Rob_Letterman%2C_SDCC_2014-2_%28cropped%29.jpg	\N
181	Джон	Красинский	1979-10-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/John_Krasinski_2022.jpg/250px-John_Krasinski_2022.jpg	\N
182	Бонг	Джун Хо	1969-09-14	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Bong_Joon_Ho_at_Busan_Film_Festival%2C_smaller.jpg/250px-Bong_Joon_Ho_at_Busan_Film_Festival%2C_smaller.jpg	\N
183	Питер	Фаррелли	1956-12-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Peter_Farrelly.jpg/250px-Peter_Farrelly.jpg	\N
184	Шип	Ли	1957-03-20	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Spike_Lee_%2854366842607%29_%28cropped2%29.jpg/250px-Spike_Lee_%2854366842607%29_%28cropped2%29.jpg	\N
187	Элизабет	Чай Васархели	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Elizabeth_Chai_Vasarhelyi_at_Sundance_2015_%28cropped%29.jpg/250px-Elizabeth_Chai_Vasarhelyi_at_Sundance_2015_%28cropped%29.jpg	\N
190	Пьер	Перифель	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Pierre_Perifel.jpg/250px-Pierre_Perifel.jpg	\N
191	Надин	Лабаки	1974-02-18	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Nadine_Labaki_by_Matteo_Chinellato_%28cropped%29.jpg/250px-Nadine_Labaki_by_Matteo_Chinellato_%28cropped%29.jpg	\N
193	Ари	Астра	1986-07-15	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Ari_Aster_at_the_2025_Cannes_Film_Festival_02.jpg/250px-Ari_Aster_at_the_2025_Cannes_Film_Festival_02.jpg	\N
195	Хлоя	Чжао	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Chlo%C3%A9_Zhao_1100157.jpg/250px-Chlo%C3%A9_Zhao_1100157.jpg	\N
197	Дестин	Дэниел Креттон	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Destin_Daniel_Cretton_by_Gage_Skidmore.jpg/250px-Destin_Daniel_Cretton_by_Gage_Skidmore.jpg	\N
199	Адам	Маккей	1968-04-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Adam_McKay-7784_%28cropped%29.jpg/250px-Adam_McKay-7784_%28cropped%29.jpg	\N
201	Кен	Квапис	1957-08-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Ken_Kwapis_2008.jpg/250px-Ken_Kwapis_2008.jpg	\N
204	Тони	Гилрой	1956-09-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Tony_Gilroy_%287732161230%29_%28cropped%29.jpg/250px-Tony_Gilroy_%287732161230%29_%28cropped%29.jpg	\N
207	Тим	Аллен	1953-06-13	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Tim_Allen_2012.jpg/250px-Tim_Allen_2012.jpg	\N
209	Ф.	Гэри Грей	1969-07-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/F._Gary_Gray_%2821226277825%29.jpg/250px-F._Gary_Gray_%2821226277825%29.jpg	\N
211	Беннетт	Миллер	1966-12-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Bennett_Altman_Miller.jpg/250px-Bennett_Altman_Miller.jpg	\N
212	Скотт	Дерриксон	1966-07-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Scott_Derrickson_by_Gage_Skidmore_2.jpg/250px-Scott_Derrickson_by_Gage_Skidmore_2.jpg	\N
220	Хосе	Падилья	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Jose_Padilha_by_Gage_Skidmore.jpg/250px-Jose_Padilha_by_Gage_Skidmore.jpg	\N
222	Адам	Вингард	1982-12-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Adam_Wingard_by_Gage_Skidmore.jpg/250px-Adam_Wingard_by_Gage_Skidmore.jpg	\N
223	Педро	Альмодовар	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Pedro_Almod%C3%B3var-69720_%28cropped%29.jpg/250px-Pedro_Almod%C3%B3var-69720_%28cropped%29.jpg	\N
224	Рюсуке	Хамагути	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Ryusuke_Hamaguchi_%28HKAFF2018%29_%28cropped%29.png/250px-Ryusuke_Hamaguchi_%28HKAFF2018%29_%28cropped%29.png	\N
226	Дэйвид	Канлифф	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/David_Cunliffe_QSO_%28cropped%29.jpg/250px-David_Cunliffe_QSO_%28cropped%29.jpg	\N
231	Роберт	Эггерс	1983-07-07	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Robert_Eggers_-_The_Witch%2CFantastic_Fest_2015-1667_%2828894993650%29_%28cropped%29.jpg/250px-Robert_Eggers_-_The_Witch%2CFantastic_Fest_2015-1667_%2828894993650%29_%28cropped%29.jpg	\N
233	Джефф	Тремейн	1966-09-04	\N	https://upload.wikimedia.org/wikipedia/commons/8/8c/Jeff_Tremaine_Bad_Grandpa_%28cropped%29.jpg	\N
236	Дэн	Трахтенберг	1981-05-11	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Dan_Trachtenberg_by_Gage_Skidmore.jpg/250px-Dan_Trachtenberg_by_Gage_Skidmore.jpg	\N
240	Энрико	Касароза	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Enrico_Casarosa_2014_%28cropped%29.jpg/250px-Enrico_Casarosa_2014_%28cropped%29.jpg	\N
241	Дэйвид	Гордон Грин	1975-04-09	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/David_Gordon_Green_at_the_2024_Toronto_International_Film_Festival_%28Cropped%29.jpg/250px-David_Gordon_Green_at_the_2024_Toronto_International_Film_Festival_%28Cropped%29.jpg	\N
245	Джейсон	Волинер	1980-06-01	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Jason_Woliner_by_Gage_Skidmore.jpg/250px-Jason_Woliner_by_Gage_Skidmore.jpg	\N
251	Анураг	Кашьяп	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Anurag_Kashyap_02.jpg/250px-Anurag_Kashyap_02.jpg	\N
252	Стивен	Содерберг	1963-01-14	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/58th_Karlovy_Vary_International_Film_Festival%2C_Steven_Soderbergh_07_%28cropped%29.jpg/250px-58th_Karlovy_Vary_International_Film_Festival%2C_Steven_Soderbergh_07_%28cropped%29.jpg	\N
255	Мэтт	Беттинелли-Олпин	1978-02-19	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Matt_Bettinelli-Olpin_by_Gage_Skidmore.jpg/250px-Matt_Bettinelli-Olpin_by_Gage_Skidmore.jpg	\N
256	Тайлер	Джиллетт	1982-03-06	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Tyler_Gillett_by_Gage_Skidmore.jpg/250px-Tyler_Gillett_by_Gage_Skidmore.jpg	\N
203	Джейсон	Райтман	1977-10-19	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Jason_Reitman_by_Gage_Skidmore.jpg/250px-Jason_Reitman_by_Gage_Skidmore.jpg	Канада
8	Серджио	Леоне	1929-01-03	1989-04-30	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Sergio_Leone_1975.jpg/250px-Sergio_Leone_1975.jpg	\N
3	Кристофер	Нолан	1970-07-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/ChrisNolanBFI150224_%2810_of_12%29_%2853532289710%29_%28cropped2%29.jpg/250px-ChrisNolanBFI150224_%2810_of_12%29_%2853532289710%29_%28cropped2%29.jpg	Великобритания
6	Питер	Джексон	1961-10-30	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Peter_Jackson_SDCC_2014.jpg/250px-Peter_Jackson_SDCC_2014.jpg	США
7	Квентин	Тарантино	1963-03-27	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Quentin_Tarantino_by_Gage_Skidmore.jpg/250px-Quentin_Tarantino_by_Gage_Skidmore.jpg	США
14	Мартин	Скорсезе	1942-11-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Martin_Scorsese-68749.jpg/250px-Martin_Scorsese-68749.jpg	США
15	Милош	Форман	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Milo%C5%A1_Forman_%28Reykjavik%2C_2009%29_%28cropped%29.jpg/250px-Milo%C5%A1_Forman_%28Reykjavik%2C_2009%29_%28cropped%29.jpg	США
16	Акира	Куросава	1910-03-23	1998-09-06	https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Kinema-Junpo-1960-February-late-4.jpg/250px-Kinema-Junpo-1960-February-late-4.jpg	Япония
17	Френк	Капра	1897-05-18	1991-09-03	https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Frank_Capra.jpg/250px-Frank_Capra.jpg	США
19	Чарльз	Чаплин	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Charlie_Chaplin_portrait_Getty_1739411952.jpg/250px-Charlie_Chaplin_portrait_Getty_1739411952.jpg	США
20	Альфред	Хичкок	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Hitchcock%2C_Alfred_02.jpg/250px-Hitchcock%2C_Alfred_02.jpg	США
21	Исао	Такахата	1935-10-29	2018-04-05	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Isao_Takahata.jpg/250px-Isao_Takahata.jpg	Япония
22	Брайан	Сингер	1965-09-17	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Brian_Singer_%22International_Competition_Jury%22_at_Opening_Ceremony_of_the_28th_Tokyo_International_Film_Festival_%2822427114066%29_%28cropped%29.jpg/250px-Brian_Singer_%22International_Competition_Jury%22_at_Opening_Ceremony_of_the_28th_Tokyo_International_Film_Festival_%2822427114066%29_%28cropped%29.jpg	США
23	Даррен	Аронофски	1969-02-12	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/OIFF_2015-07-17_193547_-_Darren_Aronofsky.jpg/250px-OIFF_2015-07-17_193547_-_Darren_Aronofsky.jpg	США
24	Джордж	Лукас	1944-05-14	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/George_Lucas_by_Gage_Skidmore.jpg/250px-George_Lucas_by_Gage_Skidmore.jpg	США
27	Джеймс	Кэмерон	1954-08-16	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Avatar_The_Way_of_Water_Tokyo_Press_Conference_James_Cameron_%2852563430565%29_%28cropped%29.jpg/250px-Avatar_The_Way_of_Water_Tokyo_Press_Conference_James_Cameron_%2852563430565%29_%28cropped%29.jpg	США
28	Мел	Гибсон	1956-01-03	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Mel_Gibson_Cannes_2016_2.jpg/250px-Mel_Gibson_Cannes_2016_2.jpg	США
63	Джеймс	Ван	\N	\N	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/James_Wan_in_2019.jpg/250px-James_Wan_in_2019.jpg	США
\.


--
-- TOC entry 4926 (class 0 OID 16456)
-- Dependencies: 219
-- Data for Name: favourite_movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favourite_movies (id_favourite_movies, id_movie, id_user) FROM stdin;
1	137523	2
2	137523	2
3	114369	2
4	137523	2
5	99685	2
6	114369	2
\.


--
-- TOC entry 4934 (class 0 OID 16581)
-- Dependencies: 227
-- Data for Name: genre_movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre_movies (id_genre_movies, id_genre, id_movie) FROM stdin;
1	3	27977
2	4	27977
3	10	27977
4	4	38650
5	13	38650
6	9	38650
7	1	47478
8	4	47478
9	5	50083
10	4	50083
11	4	54215
12	7	54215
13	11	54215
14	2	60196
15	4	60196
16	16	60196
17	5	68646
18	4	68646
19	5	71562
20	4	71562
21	4	73486
22	1	76759
23	2	76759
24	9	76759
25	1	80684
26	2	80684
27	9	80684
28	1	82971
29	2	82971
30	1	86190
31	2	86190
32	9	86190
33	2	88763
34	3	88763
35	8	88763
37	4	95327
38	17	95327
39	4	95765
40	10	95765
41	14	99685
42	5	99685
43	4	99685
44	5	102926
45	4	102926
46	7	102926
47	1	103064
48	2	103064
49	8	103064
50	14	108052
51	4	108052
52	15	108052
53	4	109830
54	10	109830
55	5	110912
56	4	110912
57	4	111161
58	14	112573
59	4	112573
60	17	112573
61	5	114369
62	4	114369
63	11	114369
65	2	114709
66	3	114709
67	5	114814
68	4	114814
69	11	114814
70	4	119217
71	10	119217
72	5	120586
73	4	120586
74	5	120689
75	4	120689
76	9	120689
77	2	120737
78	4	120737
79	9	120737
80	4	120815
81	17	120815
82	1	133093
83	8	133093
84	5	137523
85	4	137523
86	6	137523
87	1	145487
88	2	145487
89	8	145487
90	2	167260
91	4	167260
92	9	167260
93	2	167261
94	4	167261
95	9	167261
96	1	172495
97	2	172495
98	4	172495
99	4	180093
101	2	198781
102	3	198781
103	4	209144
104	11	209144
105	6	209144
106	2	241527
107	13	241527
108	9	241527
109	14	268978
110	4	268978
111	11	268978
113	2	298148
114	3	298148
116	1	317705
117	2	317705
118	2	330373
119	13	330373
120	9	330373
121	1	371746
122	2	371746
123	8	371746
124	1	373889
125	2	373889
126	13	373889
127	4	405159
128	18	405159
129	1	449088
130	2	449088
131	9	449088
132	1	468569
133	5	468569
134	4	468569
135	4	482571
136	11	482571
137	8	482571
138	2	758758
139	14	758758
140	4	758758
142	1	892769
143	2	892769
144	1	944835
145	6	944835
146	1	974015
147	2	974015
148	9	974015
149	1	988045
150	2	988045
151	11	988045
152	1	1013752
153	6	1013752
154	3	1045658
155	4	1045658
156	10	1045658
158	2	1067106
159	3	1067106
160	1	1074638
161	2	1074638
162	6	1074638
163	4	1130884
164	11	1130884
165	6	1130884
166	1	1160419
167	2	1160419
168	4	1160419
169	1	1166100
170	11	1166100
171	6	1166100
172	2	1170358
173	9	1170358
174	2	1178665
175	14	1178665
176	3	1178665
177	1	1190080
178	2	1190080
179	8	1190080
181	1	1192628
182	2	1192628
183	3	1193138
184	4	1193138
185	10	1193138
186	4	1193631
187	19	1193631
188	10	1193631
189	1	1194173
190	2	1194173
191	6	1194173
192	4	1194263
193	11	1194263
194	5	1194606
195	4	1194606
196	11	1194606
197	3	1196134
198	5	1196134
199	3	1196948
200	4	1196948
201	10	1196948
202	1	1197624
203	5	1197624
204	4	1197624
205	1	1197628
206	3	1197628
207	5	1197628
208	2	1201607
209	13	1201607
210	9	1201607
211	4	1205489
212	14	1210166
213	4	1210166
214	18	1210166
215	1	1211837
216	2	1211837
217	9	1211837
218	14	1213641
219	4	1213641
220	15	1213641
222	1	1217209
223	2	1217209
224	1	1219827
225	5	1219827
226	4	1219827
227	1	1220634
228	7	1220634
229	8	1220634
230	1	1220719
231	14	1220719
232	4	1220719
233	1	1228705
234	8	1228705
235	3	1231587
236	8	1231587
237	1	1232829
238	3	1232829
239	5	1232829
240	1	1234721
241	5	1234721
242	8	1234721
243	5	1235166
244	4	1235166
245	5	1241317
246	4	1241317
247	9	1241317
248	1	1375666
249	2	1375666
250	8	1375666
251	1	1392170
252	2	1392170
253	8	1392170
254	1	1392190
255	2	1392190
256	8	1392190
257	4	1403865
258	16	1403865
259	1	1431045
260	3	1431045
261	8	1431045
262	2	1446714
263	11	1446714
264	8	1446714
265	4	1454029
266	1	1462764
267	2	1462764
268	8	1462764
269	1	1469304
270	3	1469304
271	5	1469304
272	1	1477834
273	2	1477834
274	9	1477834
275	14	1485796
276	4	1485796
277	20	1485796
279	1	1490017
280	2	1490017
281	5	1502407
282	4	1502407
283	7	1502407
284	2	1517268
285	3	1517268
286	9	1517268
287	4	1560747
288	2	1568911
289	4	1568911
290	17	1568911
291	2	1587310
292	4	1587310
293	13	1587310
294	14	1596363
295	3	1596363
296	4	1596363
297	5	1618434
298	11	1618434
299	10	1618434
300	1	1628841
301	2	1628841
302	8	1628841
303	1	1631867
304	2	1631867
305	8	1631867
306	1	1637688
307	8	1637688
308	6	1637688
309	3	1637725
310	1	1650062
311	8	1650062
312	6	1650062
313	3	1655442
314	4	1655442
315	10	1655442
316	2	1661199
317	4	1661199
318	13	1661199
319	2	1663202
320	4	1663202
321	16	1663202
322	2	1673434
323	4	1673434
324	9	1673434
325	4	1683526
327	2	1690953
328	3	1690953
329	4	1707386
330	20	1707386
331	10	1707386
332	4	1714206
333	10	1714206
334	14	1727824
335	4	1727824
336	19	1727824
337	1	1731141
338	2	1731141
339	8	1731141
340	14	1742044
341	4	1742044
342	19	1742044
343	1	1745960
344	4	1745960
345	2	1753383
346	3	1753383
347	4	1753383
348	1	1764651
349	2	1764651
350	6	1764651
352	2	1772341
353	3	1772341
354	4	1781769
355	10	1781769
357	1	1788453
358	3	1788453
359	9	1788453
360	10	1788453
361	8	1788453
362	1	1790864
363	11	1790864
364	8	1790864
365	4	1798709
366	10	1798709
367	8	1798709
368	14	1800302
369	5	1800302
370	4	1800302
371	3	1807930
372	21	1814861
373	19	1814861
374	1	1825683
375	2	1825683
376	8	1825683
377	1	1840309
378	2	1840309
379	4	1840309
380	1	1843303
381	2	1843303
382	3	1843303
383	1	1856101
384	4	1856101
385	11	1856101
386	14	1860242
387	5	1860242
388	4	1860242
389	1	1877830
390	5	1877830
391	4	1877830
392	1	1877832
393	2	1877832
394	8	1877832
395	3	1881109
396	4	1881109
397	11	1881109
398	4	1895315
399	6	1895315
400	16	1895315
401	14	1895587
402	5	1895587
403	4	1895587
404	1	1905041
405	6	1905041
407	1	1911658
408	2	1911658
409	7	1922777
410	11	1922777
411	6	1922777
412	1	1951264
413	2	1951264
414	8	1951264
415	1	1951265
416	2	1951265
417	8	1951265
418	14	1979320
419	4	1979320
420	18	1979320
421	3	1981677
422	19	1981677
423	10	1981677
424	14	2005151
425	3	2005151
426	5	2005151
427	1	2025690
428	4	2025690
429	15	2025690
430	4	2042568
431	19	2042568
432	1	2072233
433	6	2072233
435	2	2096673
436	3	2096673
437	1	2103281
438	2	2103281
439	4	2103281
440	14	2119532
441	4	2119532
442	15	2119532
443	1	2140479
444	5	2140479
445	4	2140479
446	1	2179136
447	14	2179136
448	4	2179136
449	4	2267998
450	11	2267998
451	6	2267998
452	4	2278871
453	10	2278871
455	2	2293640
456	3	2293640
457	1	2304933
458	2	2304933
459	8	2304933
460	2	2310332
461	9	2310332
462	4	2322441
463	10	2322441
464	6	2322441
465	3	2334873
466	4	2334873
467	10	2334873
468	1	2345759
469	2	2345759
470	9	2345759
471	1	2379713
472	2	2379713
473	6	2379713
474	1	2381249
475	2	2381249
476	6	2381249
477	1	2395427
478	2	2395427
479	8	2395427
480	1	2404435
481	2	2404435
482	4	2404435
483	1	2488496
484	2	2488496
485	8	2488496
486	1	2527336
487	2	2527336
488	9	2527336
489	4	2543472
490	13	2543472
491	5	2582782
492	4	2582782
493	6	2582782
494	3	2584384
495	4	2584384
496	17	2584384
497	4	2674426
498	10	2674426
500	2	2709768
501	3	2709768
502	3	2763304
503	5	2763304
504	4	2763304
505	1	2788710
506	2	2788710
507	3	2788710
508	1	2802144
509	2	2802144
510	3	2802144
511	1	2820852
512	6	2820852
513	5	2872718
514	4	2872718
515	6	2872718
517	1	2948356
518	2	2948356
519	1	2975590
520	2	2975590
521	8	2975590
522	14	2980516
523	4	2980516
524	10	2980516
525	3	3011894
526	4	3011894
527	6	3011894
529	1	3040964
530	2	3040964
531	7	3065204
532	11	3065204
533	6	3065204
534	1	3076658
535	4	3076658
536	18	3076658
537	1	3110958
538	2	3110958
539	3	3110958
540	4	3170832
541	6	3170832
542	2	3183660
543	13	3183660
544	9	3183660
545	14	3263904
546	4	3263904
547	1	3315342
548	4	3315342
549	8	3315342
550	1	3385516
551	2	3385516
552	8	3385516
553	1	3393786
554	6	3393786
556	3	3470600
557	13	3470600
558	1	3498820
559	8	3498820
561	2	3521164
562	3	3521164
563	3	3553976
564	4	3553976
566	1	3606756
567	2	3606756
568	1	3640424
569	4	3640424
570	10	3640424
571	2	3659388
572	4	3659388
573	8	3659388
574	2	3661394
575	3	3661394
576	4	3661394
577	4	3682448
578	15	3682448
579	6	3682448
580	1	3731562
581	2	3731562
582	9	3731562
583	1	3741700
584	2	3741700
585	9	3741700
586	1	3778644
587	2	3778644
588	8	3778644
589	3	3783958
590	4	3783958
591	19	3783958
592	1	3896198
593	2	3896198
594	3	3896198
595	5	3899154
596	7	3899154
597	6	3899154
598	3	3908142
599	7	3908142
600	10	3908142
601	4	4016934
602	10	4016934
603	6	4016934
604	4	4034228
605	1	4046784
606	2	4046784
607	8	4046784
608	5	4062536
609	7	4062536
610	19	4062536
612	1	4116284
613	2	4116284
614	1	4154756
615	2	4154756
616	8	4154756
617	1	4154796
618	2	4154796
619	8	4154796
620	14	4169250
621	4	4169250
622	18	4169250
623	4	4178092
624	11	4178092
625	6	4178092
626	1	4196776
627	6	4196776
628	5	4218572
629	4	4218572
630	6	4218572
631	7	4281724
632	6	4281724
633	1	4348012
634	3	4348012
635	7	4348012
636	1	4425200
637	5	4425200
638	6	4425200
640	1	4437640
641	2	4437640
642	8	4437640
643	1	4463894
644	3	4463894
645	5	4463894
646	4	4477536
647	11	4477536
648	10	4477536
649	4	4550098
650	6	4550098
651	2	4575576
652	3	4575576
653	4	4575576
654	14	4622512
655	3	4622512
656	4	4622512
658	1	4633694
659	2	4633694
660	14	4669788
661	4	4669788
662	15	4669788
663	1	4701182
664	2	4701182
665	8	4701182
666	1	4779682
667	7	4779682
668	8	4779682
669	14	4846340
670	4	4846340
671	15	4846340
672	4	4975722
673	1	5013056
674	4	5013056
675	15	5013056
676	3	5027774
677	5	5027774
678	4	5027774
679	7	5052448
680	11	5052448
681	6	5052448
682	7	5073642
683	11	5073642
684	8	5073642
685	1	5095030
686	2	5095030
687	3	5095030
689	2	5113040
690	3	5113040
691	1	5164214
692	3	5164214
693	5	5164214
694	3	5164432
695	4	5164432
696	10	5164432
697	4	5186714
698	6	5186714
700	4	5323662
701	1	5463162
702	2	5463162
703	3	5463162
704	4	5580390
705	9	5580390
706	10	5580390
707	4	5726616
708	10	5726616
709	7	5814060
710	11	5814060
711	6	5814060
712	2	5884052
713	3	5884052
714	13	5884052
715	2	6139732
716	3	6139732
717	13	6139732
718	1	6320628
719	2	6320628
720	3	6320628
721	1	6450804
722	2	6450804
723	8	6450804
724	4	6644200
725	7	6644200
726	8	6644200
727	4	6751668
728	6	6751668
729	7	6857112
730	11	6857112
731	6	6857112
732	14	6966692
733	3	6966692
734	4	6966692
735	3	7131622
736	4	7131622
737	5	7286456
738	4	7286456
739	6	7286456
740	14	7349662
741	3	7349662
742	5	7349662
743	4	7653254
744	10	7653254
745	22	7775622
746	2	7775622
747	18	7775622
749	2	7979580
750	3	7979580
751	3	8079248
752	9	8079248
753	19	8079248
755	2	8115900
756	3	8115900
757	4	8267604
758	1	8328716
759	2	8328716
760	7	8328716
761	1	8367814
762	5	8367814
763	4	8772262
764	7	8772262
765	11	8772262
766	3	8946378
767	5	8946378
768	4	8946378
769	4	8970448
770	1	9032400
771	2	9032400
772	9	9032400
773	2	9243804
774	4	9243804
775	9	9243804
776	1	9376612
777	2	9376612
778	9	9376612
779	1	9419884
780	2	9419884
781	9	9419884
782	4	9770150
783	3	10223460
784	19	10223460
785	10	10223460
786	3	10304142
787	4	10304142
788	15	10304142
789	1	10366206
790	5	10366206
791	6	10366206
792	1	10648342
793	2	10648342
794	3	10648342
795	1	10726604
796	5	10726604
797	6	10726604
798	4	10731256
799	11	10731256
800	6	10731256
801	1	10731768
802	4	10731768
803	6	10731768
804	1	10872600
805	2	10872600
806	9	10872600
807	1	10954600
808	2	10954600
809	3	10954600
810	7	10954984
811	11	10954984
812	8	10954984
814	1	11032374
815	2	11032374
816	1	11138512
817	2	11138512
818	4	11138512
819	14	11214590
820	5	11214590
821	4	11214590
822	3	11286314
823	4	11286314
824	8	11286314
825	4	11388406
826	11	11388406
827	6	11388406
828	22	11466222
829	1	11466222
830	3	11466222
831	3	11564570
832	5	11564570
833	4	11564570
834	1	11671006
835	2	11671006
836	3	11671006
837	1	11866324
838	2	11866324
839	7	11866324
840	4	12004038
841	7	12004038
842	11	12004038
843	1	12361974
844	2	12361974
845	9	12361974
846	1	12412888
847	2	12412888
848	3	12412888
849	4	12618926
850	1	12731980
851	4	12731980
852	16	12731980
854	2	12801262
855	3	12801262
856	7	12921446
857	3	13143964
858	1	13320622
859	2	13320622
860	3	13320622
861	3	13403046
862	7	13403046
863	10	13403046
864	3	13521006
865	4	13521006
867	2	13634480
868	3	13634480
869	4	13833688
870	4	14039582
871	4	14042066
872	9	14042066
873	11	14042066
874	5	14128670
875	4	14128670
876	11	14128670
877	3	14209916
878	5	14209916
879	6	14209916
880	22	14992922
881	5	14992922
882	1	15239678
883	2	15239678
884	4	15239678
885	1	15325794
886	6	15325794
887	7	15474916
888	11	15474916
889	6	15474916
891	1	15837338
892	2	15837338
893	4	16419074
894	18	16419074
895	7	17663992
896	11	17663992
897	6	17663992
\.


--
-- TOC entry 4932 (class 0 OID 16568)
-- Dependencies: 225
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (id_genre, name, name_ru) FROM stdin;
1	Action	Экшн
2	Adventure	Приключения
3	Comedy	Комедия
4	Drama	Драма
5	Crime	Криминал
6	Thriller	Триллер
7	Horror	Ужасы
8	Sci-Fi	Фантастика
9	Fantasy	Фэнтези
10	Romance	Мелодрама
11	Mystery	Детектив
13	Family	Семейный
14	Biography	Биография
15	History	Исторический
16	Western	Вестерн
17	War	Военный
18	Sport	Спорт
19	Music	Музыка
20	Musical	Мюзикл
21	Short	Короткометражка
22	Documentary	Документальный
24	Жанр	Жанр
\.


--
-- TOC entry 4925 (class 0 OID 16447)
-- Dependencies: 218
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies (title, orig_title, rus_title, release_date, poster_url, length, id_movie, age_rating, mood) FROM stdin;
Scream	Scream	Крик	2000-01-01	\N	150	2	R	драматичный
The VelociPastor	The VelociPastor	ВелочиПастор	2019-08-13	https://m.media-amazon.com/images/M/MV5BZTQyZDEwMDQtOTYyYS00ZmRkLWI0Y2EtNTRhNjhiZTJmMDVmXkEyXkFqcGc@._V1_SX300.jpg	75	1843303	R	комедийный
The Love Witch	The Love Witch	Ведьма любви	2017-03-10	https://m.media-amazon.com/images/M/MV5BMjA5NDEyMjQwNV5BMl5BanBnXkFtZTgwNDQ1MjMwMDI@._V1_SX300.jpg	120	3908142	R	комедийный
Requiem for a Dream	Requiem for a Dream	Реквием по мечте	2000-12-15	https://m.media-amazon.com/images/M/MV5BN2ZlMjIzZjctYzA2My00ZWYyLWI4ZjctMGI2NWYyNzFiZjAwXkEyXkFqcGc@._V1_SX300.jpg	102	180093	NC-17	драматичный
The Dark Knight	The Dark Knight	Тёмный рыцарь	2008-07-18	https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg	152	468569	PG-13	драматичный
Inception	Inception	Начало	2010-07-16	https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg	148	1375666	PG-13	экшн
The Shawshank Redemption	The Shawshank Redemption	Побег из Шоушенка	1994-10-14	https://m.media-amazon.com/images/M/MV5BMDAyY2FhYjctNDc5OS00MDNlLThiMGUtY2UxYWVkNGY2ZjljXkEyXkFqcGc@._V1_SX300.jpg	142	111161	R	драматичный
The Godfather Part II	The Godfather Part II	Крёстный отец 2	1974-12-18	https://m.media-amazon.com/images/M/MV5BMDIxMzBlZDktZjMxNy00ZGI4LTgxNDEtYWRlNzRjMjJmOGQ1XkEyXkFqcGc@._V1_SX300.jpg	202	71562	R	драматичный
The Godfather	The Godfather	Крестный отец	1972-03-24	https://m.media-amazon.com/images/M/MV5BNGEwYjgwOGQtYjg5ZS00Njc1LTk2ZGEtM2QwZWQ2NjdhZTE5XkEyXkFqcGc@._V1_SX300.jpg	175	68646	R	драматичный
Schindler's List	Schindler's List	Список Шиндлера	1994-02-04	https://m.media-amazon.com/images/M/MV5BNjM1ZDQxYWUtMzQyZS00MTE1LWJmZGYtNGUyNTdlYjM3ZmVmXkEyXkFqcGc@._V1_SX300.jpg	195	108052	R	драматичный
Pulp Fiction	Pulp Fiction	Криминальное чтиво	1994-10-14	https://m.media-amazon.com/images/M/MV5BYTViYTE3ZGQtNDBlMC00ZTAyLTkyODMtZGRiZDg0MjA2YThkXkEyXkFqcGc@._V1_SX300.jpg	154	110912	R	драматичный
The Good, the Bad and the Ugly	The Good, the Bad and the Ugly	Хороший, плохой, злой	1967-12-29	https://m.media-amazon.com/images/M/MV5BMWM5ZjQxM2YtNDlmYi00ZDNhLWI4MWUtN2VkYjBlMTY1ZTkwXkEyXkFqcGc@._V1_SX300.jpg	178	60196	R	драматичный
Fight Club	Fight Club	Бойцовский клуб	1999-10-15	https://m.media-amazon.com/images/M/MV5BOTgyOGQ1NDItNGU3Ny00MjU3LTg2YWEtNmEyYjBiMjI1Y2M5XkEyXkFqcGc@._V1_SX300.jpg	139	137523	R	драматичный
Forrest Gump	Forrest Gump	Форрест Гамп	1994-07-06	https://m.media-amazon.com/images/M/MV5BNDYwNzVjMTItZmU5YS00YjQ5LTljYjgtMjY2NDVmYWMyNWFmXkEyXkFqcGc@._V1_SX300.jpg	142	109830	PG-13	драматичный
The Lord of the Rings: The Two Towers	The Lord of the Rings: The Two Towers	Властелин колец: Две крепости	2002-12-18	https://m.media-amazon.com/images/M/MV5BMGQxMDdiOWUtYjc1Ni00YzM1LWE2NjMtZTg3Y2JkMjEzMTJjXkEyXkFqcGc@._V1_SX300.jpg	179	167261	PG-13	драматичный
Back to the Future	Back to the Future	Назад в будущее	1985-07-03	https://m.media-amazon.com/images/M/MV5BZmM3ZjE0NzctNjBiOC00MDZmLTgzMTUtNGVlOWFlOTNiZDJiXkEyXkFqcGc@._V1_SX300.jpg	116	88763	PG	комедийный
Goodfellas	Goodfellas	Славные парни	1990-09-21	https://m.media-amazon.com/images/M/MV5BN2E5NzI2ZGMtY2VjNi00YTRjLWI1MDUtZGY5OWU1MWJjZjRjXkEyXkFqcGc@._V1_SX300.jpg	145	99685	R	драматичный
One Flew Over the Cuckoo's Nest	One Flew Over the Cuckoo's Nest	Пролетая над гнездом кукушки	1975-11-21	https://m.media-amazon.com/images/M/MV5BYjBkMjgzMzYtNzRiMS00NDc3LWE4YTUtZjYxYjZhNjNhYzhhXkEyXkFqcGc@._V1_SX300.jpg	133	73486	R	драматичный
Seven Samurai	Seven Samurai	Семь самураев	1956-11-19	https://m.media-amazon.com/images/M/MV5BZjliMWExOTMtZDQ3ZS00NWU3LWIyN2EtMjllNzk3ZTNlYzg4XkEyXkFqcGc@._V1_SX300.jpg	207	47478	Not Rated	драматичный
The Silence of the Lambs	The Silence of the Lambs	Молчание ягнят	1991-02-14	https://m.media-amazon.com/images/M/MV5BNDdhOGJhYzctYzYwZC00YmI2LWI0MjctYjg4ODdlMDExYjBlXkEyXkFqcGc@._V1_SX300.jpg	118	102926	R	драматичный
Psycho	Psycho	Психо	1960-09-08	https://m.media-amazon.com/images/M/MV5BYjZhMzFiZjItODA3ZC00MmRhLWIzMGYtMmVjOWUwYTA3MTRjXkEyXkFqcGc@._V1_SX300.jpg	109	54215	R	драматичный
The Usual Suspects	The Usual Suspects	Подозрительные лица	1995-08-16	https://m.media-amazon.com/images/M/MV5BOTE5MDUxZDUtZWZmZC00NDVmLWFhOGQtNWI2YTc4NzY3MGQ0XkEyXkFqcGc@._V1_SX300.jpg	106	114814	R	драматичный
Modern Times	Modern Times	Новые времена	1936-02-25	https://m.media-amazon.com/images/M/MV5BODVkZGFhNGQtYjdiYi00Njc4LWFmYTItNTlmNzJjMTg1ZDc5XkEyXkFqcGc@._V1_SX300.jpg	87	27977	G	драматичный
Terminator 2: Judgment Day	Terminator 2: Judgment Day	Терминатор 2: Судный день	1991-07-03	https://m.media-amazon.com/images/M/MV5BNGMyMGNkMDUtMjc2Ni00NWFlLTgyODEtZTY2MzBiZTg0OWZiXkEyXkFqcGc@._V1_SX300.jpg	137	103064	R	экшн
Se7en	Se7en	Семь	1995-09-22	https://m.media-amazon.com/images/M/MV5BY2IzNzMxZjctZjUxZi00YzAxLTk3ZjMtODFjODdhMDU5NDM1XkEyXkFqcGc@._V1_SX300.jpg	127	114369	R	драматичный
Star Wars: Episode IV - A New Hope	Star Wars: Episode IV - A New Hope	Звёздные войны: Эпизод 4- Новая Надежда	1977-05-25	https://m.media-amazon.com/images/M/MV5BOGUwMDk0Y2MtNjBlNi00NmRiLTk2MWYtMGMyMDlhYmI4ZDBjXkEyXkFqcGc@._V1_SX300.jpg	121	76759	PG	экшн
Memento	Memento	Вспомни	2001-05-25	https://m.media-amazon.com/images/M/MV5BYmQ3MjliNjAtNWFiZS00YWI1LTlmZTktMzBiNDE1NjRhZjU0XkEyXkFqcGc@._V1_SX300.jpg	113	209144	R	драматичный
Star Wars: Episode V - The Empire Strikes Back	Star Wars: Episode V - The Empire Strikes Back	Звёздные войны: Эпизод V - Империя наносит ответный удар	1980-06-18	https://m.media-amazon.com/images/M/MV5BMTkxNGFlNDktZmJkNC00MDdhLTg0MTEtZjZiYWI3MGE5NWIwXkEyXkFqcGc@._V1_SX300.jpg	124	80684	PG	экшн
Star Wars: Episode VI - Return of the Jedi	Star Wars: Episode VI - Return of the Jedi	Звёздные войны: Эпизод VI - Возвращение джедая	1983-05-25	https://m.media-amazon.com/images/M/MV5BNWEwOTI0MmUtMGNmNy00ODViLTlkZDQtZTg1YmQ3MDgyNTUzXkEyXkFqcGc@._V1_SX300.jpg	131	86190	PG	экшн
Raiders of the Lost Ark	Raiders of the Lost Ark	Индиана Джонс: В поисках утраченного Ковчега	1981-06-12	https://m.media-amazon.com/images/M/MV5BOGNhMjg2ZjgtYzk4Ni00MTViLTg1MmUtYzM2MDZiYjZlMmU3XkEyXkFqcGc@._V1_SX300.jpg	115	82971	PG	экшн
M.S. Dhoni: The Untold Story	M.S. Dhoni: The Untold Story	РС. Дхони: Нерассказанная история	2016-09-30	https://m.media-amazon.com/images/M/MV5BM2UwZTNkMmItYmYzOS00MTk3LTg3NDgtNzg5ZjYxNTIzNzY4XkEyXkFqcGc@._V1_SX300.jpg	184	4169250	R	драматичный
Terrifier	Terrifier	Ужас	2018-03-27	https://m.media-amazon.com/images/M/MV5BN2M5MzJlYzctNmZhOC00MTFmLWIxZmUtN2I4NzY5MTlmNDdmXkEyXkFqcGc@._V1_SX300.jpg	85	4281724	R	экшн
Mayhem	Mayhem	хаос	2017-11-10	https://m.media-amazon.com/images/M/MV5BM2I2ZGMzNzItZTdkYS00YWNmLWE0NGEtOGY3MTM1YmFkMjYxXkEyXkFqcGc@._V1_SX300.jpg	86	4348012	R	комедийный
Color Out of Space	Color Out of Space	Цвет вне космоса	2020-02-25	https://m.media-amazon.com/images/M/MV5BNmNlNDMwNzUtYzJlOC00MjRkLTkyNjYtZjY3NTk1NjZlZGMxXkEyXkFqcGc@._V1_SX300.jpg	111	5073642	R	страшный
Old Henry	Old Henry	Старый Генри	2021-10-01	https://m.media-amazon.com/images/M/MV5BYzI5NTJiZTYtNDE0MS00ZTc3LWFiZTItOTY2Y2NlYTc2Mzc0XkEyXkFqcGc@._V1_SX300.jpg	99	12731980	R	драматичный
Skyfall	Skyfall	007: Координаты «Скайфолл»	2012-11-09	https://m.media-amazon.com/images/M/MV5BNjAzMWNkODUtM2FlMi00NzgyLWJhMGUtMWEyNDYyZGFiN2RlXkEyXkFqcGc@._V1_SX300.jpg	143	1074638	PG-13	экшн
Sherlock Holmes	Sherlock Holmes	Шерлок Холмс	2009-12-25	https://m.media-amazon.com/images/M/MV5BMTg0NjEwNjUxM15BMl5BanBnXkFtZTcwMzk0MjQ5Mg@@._V1_SX300.jpg	128	988045	PG-13	экшн
Braveheart	Braveheart	Храброе сердце	1995-05-24	https://m.media-amazon.com/images/M/MV5BNGMxZDBhNGQtYTZlNi00N2UzLWI4NDEtNmUzNWM2NTdmZDA0XkEyXkFqcGc@._V1_SX300.jpg	178	112573	R	драматичный
The Green Mile	The Green Mile	Зелёная миля	1999-12-10	https://m.media-amazon.com/images/M/MV5BMTUxMzQyNjA5MF5BMl5BanBnXkFtZTYwOTU2NTY3._V1_SX300.jpg	189	120689	R	драматичный
Saving Private Ryan	Saving Private Ryan	Спасти рядового Райана	1998-07-24	https://m.media-amazon.com/images/M/MV5BZGZhZGQ1ZWUtZTZjYS00MDJhLWFkYjctN2ZlYjE5NWYwZDM2XkEyXkFqcGc@._V1_SX300.jpg	169	120815	R	драматичный
The Matrix	The Matrix	Матрица	1999-03-31	https://m.media-amazon.com/images/M/MV5BN2NmN2VhMTQtMDNiOS00NDlhLTliMjgtODE2ZTY0ODQyNDRhXkEyXkFqcGc@._V1_SX300.jpg	136	133093	R	экшн
Gladiator	Gladiator	Гладиатор	2000-05-05	https://m.media-amazon.com/images/M/MV5BYWQ4YmNjYjEtOWE1Zi00Y2U4LWI4NTAtMTU0MjkxNWQ1ZmJiXkEyXkFqcGc@._V1_SX300.jpg	155	172495	R	драматичный
A Beautiful Mind	A Beautiful Mind	Игры разума	2002-01-04	https://m.media-amazon.com/images/M/MV5BNzljZTk5ZDgtZTQ1Zi00NTM4LThlOGUtZDk2MGM4NDQ4NWQyXkEyXkFqcGc@._V1_SX300.jpg	135	268978	PG-13	драматичный
Million Dollar Baby	Million Dollar Baby	Малышка на миллион	2005-01-28	https://m.media-amazon.com/images/M/MV5BMTkxNzA1NDQxOV5BMl5BanBnXkFtZTcwNTkyMTIzMw@@._V1_SX300.jpg	132	405159	PG-13	драматичный
Silver Linings Playbook	Silver Linings Playbook	Мой парень - псих	2012-12-25	https://m.media-amazon.com/images/M/MV5BMTM2MTI5NzA3MF5BMl5BanBnXkFtZTcwODExNTc0OA@@._V1_SX300.jpg	122	1045658	R	драматичный
Mad Max: Fury Road	Mad Max: Fury Road	Безумный Макс: Дорога ярости	2015-05-15	https://m.media-amazon.com/images/M/MV5BZDRkODJhOTgtOTc1OC00NTgzLTk4NjItNDgxZDY4YjlmNDY2XkEyXkFqcGc@._V1_SX300.jpg	120	1392190	R	экшн
Toy Story	Toy Story	История игрушек	1995-11-22	https://m.media-amazon.com/images/M/MV5BZTA3OWVjOWItNjE1NS00NzZiLWE1MjgtZDZhMWI1ZTlkNzYwXkEyXkFqcGc@._V1_SX300.jpg	81	114709	G	комедийный
Good Will Hunting	Good Will Hunting	Умница Уилл Хантинг	1998-01-09	https://m.media-amazon.com/images/M/MV5BNDdjZGQ5YzEtNTc2My00Mjc0LWFlMTctYzkwMzZlNzdiZWYzXkEyXkFqcGc@._V1_SX300.jpg	126	119217	R	драматичный
Justice League	Justice League	Лига справедливости	2017-11-17	https://m.media-amazon.com/images/M/MV5BMjM5YmQxM2YtZjI2Yy00YjhhLTg5N2MtMTEyMzdlZDU3OTVhXkEyXkFqcGc@._V1_SX300.jpg	120	974015	PG-13	экшн
Fast & Furious	Fast & Furious	Форсаж 4	2009-04-03	https://m.media-amazon.com/images/M/MV5BM2Y1YzhkNzUtMzhmZC00OTFkLWJjZDktMWYzZmQ0Y2Y5ODcwXkEyXkFqcGc@._V1_SX300.jpg	107	1013752	PG-13	экшн
Aquaman	Aquaman	Аквамен	2018-12-21	https://m.media-amazon.com/images/M/MV5BOTk5ODg0OTU5M15BMl5BanBnXkFtZTgwMDQ3MDY3NjM@._V1_SX300.jpg	143	1477834	PG-13	экшн
Deadpool	Deadpool	Дэдпул	2016-02-12	https://m.media-amazon.com/images/M/MV5BNzY3ZWU5NGQtOTViNC00ZWVmLTliNjAtNzViNzlkZWQ4YzQ4XkEyXkFqcGc@._V1_SX300.jpg	108	1431045	R	комедийный
How to Train Your Dragon	How to Train Your Dragon	Как приручить дракона	2010-03-26	https://m.media-amazon.com/images/M/MV5BMjA5NDQyMjc2NF5BMl5BanBnXkFtZTcwMjg5ODcyMw@@._V1_SX300.jpg	98	892769	PG	экшн
Into the Wild	Into the Wild	В дикую природу	2007-10-19	https://m.media-amazon.com/images/M/MV5BNTgwZTJhNWMtNzVjMy00YzQzLWI4MTAtYmJhOGQ5ZmQ3MDM0XkEyXkFqcGc@._V1_SX300.jpg	148	758758	R	драматичный
Shutter Island	Shutter Island	Остров проклятых	2010-02-19	https://m.media-amazon.com/images/M/MV5BN2FjNWExYzEtY2YzOC00YjNlLTllMTQtNmIwM2Q1YzBhOWM1XkEyXkFqcGc@._V1_SX300.jpg	138	1130884	R	драматичный
Salt	Salt	Солт	2010-07-23	https://m.media-amazon.com/images/M/MV5BMjIyODA2NDg4NV5BMl5BanBnXkFtZTcwMjg4NDAwMw@@._V1_SX300.jpg	100	944835	PG-13	экшн
True Grit	True Grit	Настоящая выдержка	2010-12-22	https://m.media-amazon.com/images/M/MV5BMTU5MjU3MTI4OF5BMl5BanBnXkFtZTcwMTQxOTAxNA@@._V1_SX300.jpg	110	1403865	PG-13	драматичный
Prometheus	Prometheus	Прометей	2012-06-08	https://m.media-amazon.com/images/M/MV5BMTY3NzIyNTA2NV5BMl5BanBnXkFtZTcwNzE2NjI4Nw@@._V1_SX300.jpg	124	1446714	R	экшн
Baywatch	Baywatch	Спасатели Малибу	2017-05-25	https://m.media-amazon.com/images/M/MV5BNTA4MjQ0ODQzNF5BMl5BanBnXkFtZTgwNzA5NjYzMjI@._V1_SX300.jpg	116	1469304	R	комедийный
The Hunger Games	The Hunger Games	Голодные игры	2012-03-23	https://m.media-amazon.com/images/M/MV5BMWI1OGM4YjQtNmIxNi00YmE2LWJkNTAtY2Q0YjU4NTI5NWQyXkEyXkFqcGc@._V1_SX300.jpg	142	1392170	PG-13	экшн
The Lego Movie	The Lego Movie	Лего Фильм	2014-02-07	https://m.media-amazon.com/images/M/MV5BMTg4MDk1ODExN15BMl5BanBnXkFtZTgwNzIyNjg3MDE@._V1_SX300.jpg	100	1490017	PG	экшн
The Artist	The Artist	Артист	2012-01-20	https://m.media-amazon.com/images/M/MV5BYjEwOGZmM2QtNjY4Mi00NjI0LTkyZjItZDEzZGI1YTEzMDg1XkEyXkFqcGc@._V1_SX300.jpg	100	1655442	PG-13	драматичный
Her	Her	Она	2014-01-10	https://m.media-amazon.com/images/M/MV5BMjA1Nzk0OTM2OF5BMl5BanBnXkFtZTgwNjU2NjEwMDE@._V1_SX300.jpg	126	1798709	R	драматичный
Spotlight	Spotlight	В центре внимания	2015-11-20	https://m.media-amazon.com/images/M/MV5BMjIyOTM5OTIzNV5BMl5BanBnXkFtZTgwMDkzODE2NjE@._V1_SX300.jpg	129	1895587	R	драматичный
Black Panther	Black Panther	Чёрная пантера	2018-02-16	https://m.media-amazon.com/images/M/MV5BMTg1MTY2MjYzNV5BMl5BanBnXkFtZTgwMTc4NTMwNDI@._V1_SX300.jpg	134	1825683	PG-13	экшн
The Master	The Master	Мастер	2012-09-21	https://m.media-amazon.com/images/M/MV5BMTQ2NjQ5MzMwMF5BMl5BanBnXkFtZTcwMjczNTAzOA@@._V1_SX300.jpg	138	1560747	R	драматичный
Nightcrawler	Nightcrawler	Стрингер	2014-10-31	https://m.media-amazon.com/images/M/MV5BYjMwMmI5MWQtOTU4OS00OTAyLTg0OTYtNmQ5YzExZTQ3ZWJhXkEyXkFqcGc@._V1_SX300.jpg	117	2872718	R	драматичный
Room	Room	Комната	2016-01-22	https://m.media-amazon.com/images/M/MV5BMjE4NzgzNzEwMl5BMl5BanBnXkFtZTgwMTMzMDE0NjE@._V1_SX300.jpg	118	3170832	R	драматичный
Avengers: Age of Ultron	Avengers: Age of Ultron	Мстители: Эра Альтрона	2015-05-01	https://m.media-amazon.com/images/M/MV5BODBhYTg1NGQtNGVmNS00ZTdiLThjYTYtZDFkNzRiNTZmNDZjXkEyXkFqcGc@._V1_SX300.jpg	141	2395427	PG-13	экшн
Star Wars: Episode VIII - The Last Jedi	Star Wars: Episode VIII - The Last Jedi	Звёздные войны: Эпизод VIII - Последние джедаи	2017-12-15	https://m.media-amazon.com/images/M/MV5BMjQ1MzcxNjg4N15BMl5BanBnXkFtZTgwNzgwMjY4MzI@._V1_SX300.jpg	152	2527336	PG-13	экшн
Furious 7	Furious 7	Форсаж 7	2015-04-03	https://m.media-amazon.com/images/M/MV5BMTQxOTA2NDUzOV5BMl5BanBnXkFtZTgwNzY2MTMxMzE@._V1_SX300.jpg	137	2820852	PG-13	экшн
The Accountant	The Accountant	Бухгалтер	2016-10-14	https://m.media-amazon.com/images/M/MV5BNDc5Mzg2NTYxNV5BMl5BanBnXkFtZTgwMjQ2ODAwOTE@._V1_SX300.jpg	128	2140479	R	драматичный
Avengers: Infinity War	Avengers: Infinity War	Мстители: Война бесконечности	2018-04-27	https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_SX300.jpg	149	4154756	PG-13	экшн
Avengers: Endgame	Avengers: Endgame	Мстители: Финал	2019-04-26	https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg	181	4154796	PG-13	экшн
Logan	Logan	Логан	2017-03-03	https://m.media-amazon.com/images/M/MV5BM2JjODdkMGMtNmY2YS00OGM2LThiY2YtZGYyNzE4Nzc2ODA0XkEyXkFqcGc@._V1_SX300.jpg	137	3315342	R	драматичный
X-Men: Apocalypse	X-Men: Apocalypse	Люди Икс: Апокалипсис	2016-05-27	https://m.media-amazon.com/images/M/MV5BNjVhNWY3NjItNmZjOS00NTU3LWFiZTctNzdjNGM5Y2Y0MDUwXkEyXkFqcGc@._V1_SX300.jpg	144	3385516	PG-13	экшн
Solo: A Star Wars Story	Solo: A Star Wars Story	Хан Соло. Звёздные войны: Истории	2018-05-25	https://m.media-amazon.com/images/M/MV5BOTM2NTI3NTc3Nl5BMl5BanBnXkFtZTgwNzM1OTQyNTM@._V1_SX300.jpg	135	3778644	PG-13	экшн
Guardians of the Galaxy Vol. 2	Guardians of the Galaxy Vol. 2	Стражи Галактики. Часть 2	2017-05-05	https://m.media-amazon.com/images/M/MV5BNWE5MGI3MDctMmU5Ni00YzI2LWEzMTQtZGIyZDA5MzQzNDBhXkEyXkFqcGc@._V1_SX300.jpg	136	3896198	PG-13	комедийный
Jack Reacher: Never Go Back	Jack Reacher: Never Go Back	Джек Ричер: Никогда не возвращайся	2016-10-21	https://m.media-amazon.com/images/M/MV5BODQ3ODQ3NDI4NV5BMl5BanBnXkFtZTgwMDY1Mzk5OTE@._V1_SX300.jpg	118	3393786	PG-13	экшн
Get Out	Get Out	Прочь	2017-02-24	https://m.media-amazon.com/images/M/MV5BMjUxMDQwNjcyNl5BMl5BanBnXkFtZTgwNzcwMzc0MTI@._V1_SX300.jpg	104	5052448	R	экшн
The Shape of Water	The Shape of Water	Форма воды	2017-12-22	https://m.media-amazon.com/images/M/MV5BOGFlMTM2MTgtZDdlMy00ZDZlLWFjOTUtZDMzMGEwNmNiMWY0XkEyXkFqcGc@._V1_SX300.jpg	123	5580390	R	драматичный
Parasite	Parasite	Паразиты	2019-11-08	https://m.media-amazon.com/images/M/MV5BYjk1Y2U4MjQtY2ZiNS00OWQyLWI3MmYtZWUwNmRjYWRiNWNhXkEyXkFqcGc@._V1_SX300.jpg	132	6751668	R	драматичный
Joker	Joker	Джокер	2019-10-04	https://m.media-amazon.com/images/M/MV5BNzY3OWQ5NDktNWQ2OC00ZjdlLThkMmItMDhhNDk3NTFiZGU4XkEyXkFqcGc@._V1_SX300.jpg	122	7286456	R	драматичный
Ant-Man and the Wasp	Ant-Man and the Wasp	Человек-муравей и Оса	2018-07-06	https://m.media-amazon.com/images/M/MV5BODVkY2ZmZTAtYzFhMi00YzZlLWE2YWMtMDBiYjY2OTU4ZWM0XkEyXkFqcGc@._V1_SX300.jpg	118	5095030	PG-13	комедийный
Deadpool 2	Deadpool 2	Дэдпул 2	2018-05-18	https://m.media-amazon.com/images/M/MV5BNGY3N2ZhYmMtYTlmYi00ZWIzLWJiZWMtMjgxMjljYTk3MDAwXkEyXkFqcGc@._V1_SX300.jpg	119	5463162	R	комедийный
Battle of the Sexes	Battle of the Sexes	Битва полов	2017-09-29	https://m.media-amazon.com/images/M/MV5BYmRmODY1OTAtMWRkZS00NmNhLTgzMjgtOTM0YWYwY2RlYTc0XkEyXkFqcGc@._V1_SX300.jpg	121	4622512	PG-13	драматичный
Capernaum	Capernaum	Капернаум	2018-09-20	https://m.media-amazon.com/images/M/MV5BYzEyMzQ1OTktZTljZi00OWQzLWE2ZmUtZjQyNzBjYjE1NTc0XkEyXkFqcGc@._V1_SX300.jpg	126	8267604	R	драматичный
Eternals	Eternals	Вечные	2021-11-05	https://m.media-amazon.com/images/M/MV5BZTBiZjI2M2UtZTNiNy00NmU4LWJiMjYtZjk4MDIzMzhlMjFlXkEyXkFqcGc@._V1_SX300.jpg	156	9032400	PG-13	экшн
Shang-Chi and the Legend of the Ten Rings	Shang-Chi and the Legend of the Ten Rings	Шан-Чи и легенда десяти колец	2021-09-03	https://m.media-amazon.com/images/M/MV5BZmY5MDcyNzAtYzg3MC00MGNlLTg3OGItNmRjYThkZGVlNzAyXkEyXkFqcGc@._V1_SX300.jpg	132	9376612	PG-13	экшн
Thor: Love and Thunder	Thor: Love and Thunder	Тор: Любовь и гром	2022-07-08	https://m.media-amazon.com/images/M/MV5BZjRiMDhiZjQtNjk5Yi00ZDcwLTkyYTEtMDc1NjdmNjFhNGIzXkEyXkFqcGc@._V1_SX300.jpg	118	10648342	PG-13	комедийный
Doctor Strange	Doctor Strange	Доктор Стрэндж	2016-11-04	https://m.media-amazon.com/images/M/MV5BNjgwNzAzNjk1Nl5BMl5BanBnXkFtZTgwMzQ2NjI1OTE@._V1_SX300.jpg	115	1211837	PG-13	экшн
The Gentlemen	The Gentlemen	Джентльмены	2020-01-24	https://m.media-amazon.com/images/M/MV5BMjE2ZjQ4ZGMtZjFhMi00NmI5LTliNjEtODczMWMxNjliZjgxXkEyXkFqcGc@._V1_SX300.jpg	113	8367814	R	экшн
Zack Snyder's Justice League	Zack Snyder's Justice League	Лига справедливости Зака Снайдера	2021-03-18	https://m.media-amazon.com/images/M/MV5BNDA0MzM5YTctZTU2My00NGQ5LWE2NTEtNDM0MjZmMDBkOTZkXkEyXkFqcGc@._V1_SX300.jpg	242	12361974	R	экшн
Ant-Man and the Wasp: Quantumania	Ant-Man and the Wasp: Quantumania	Человек-муравей и Оса: Квантомания	2023-02-17	https://m.media-amazon.com/images/M/MV5BMThkYWY5ZjQtYjJlMS00MDFmLWFkYzEtODEzZjg5YWFmMGY4XkEyXkFqcGc@._V1_SX300.jpg	124	10954600	PG-13	комедийный
Spider-Man: No Way Home	Spider-Man: No Way Home	Человек-паук: Нет пути домой	2021-12-17	https://m.media-amazon.com/images/M/MV5BMmFiZGZjMmEtMTA0Ni00MzA2LTljMTYtZGI2MGJmZWYzZTQ2XkEyXkFqcGc@._V1_SX300.jpg	148	10872600	PG-13	экшн
Iron Man 2	Iron Man 2	Железный человек 2	2010-05-07	https://m.media-amazon.com/images/M/MV5BYWYyOGQzOGYtMGQ1My00ZWYxLTgzZjktZWYzN2IwYjkxYzM0XkEyXkFqcGc@._V1_SX300.jpg	124	1228705	PG-13	экшн
Ghost in the Shell	Ghost in the Shell	Призрак в доспехах	2017-03-31	https://m.media-amazon.com/images/M/MV5BNzBkNjdjZTctNjdhOS00NmIyLTlkNjQtY2EwNGMwYmZjNTIxXkEyXkFqcGc@._V1_SX300.jpg	107	1219827	PG-13	драматичный
Resident Evil: Afterlife	Resident Evil: Afterlife	Обитель зла: Жизнь после смерти	2010-09-10	https://m.media-amazon.com/images/M/MV5BNTgyZmNmNjctMTdlNC00NjEzLWIwZjAtYzRmNGQzYWIzOGFmXkEyXkFqcGc@._V1_SX300.jpg	96	1220634	R	экшн
The Revenant	The Revenant	Выживший	2016-01-08	https://m.media-amazon.com/images/M/MV5BYTgwNmQzZDctMjNmOS00OTExLTkwM2UtNzJmOTJhODFjOTdlXkEyXkFqcGc@._V1_SX300.jpg	156	1663202	R	драматичный
The Batman	The Batman	Бэтмен	2022-03-04	https://m.media-amazon.com/images/M/MV5BMmU5NGJlMzAtMGNmOC00YjJjLTgyMzUtNjAyYmE4Njg5YWMyXkEyXkFqcGc@._V1_SX300.jpg	176	1877830	PG-13	драматичный
Borat Subsequent Moviefilm	Borat Subsequent Moviefilm	Борат	2020-10-23	https://m.media-amazon.com/images/M/MV5BOWJmNDcyOTItYTE0ZS00NzAwLThjNGUtYTdhMjBjMTAwNDc4XkEyXkFqcGc@._V1_SX300.jpg	95	13143964	R	комедийный
The Lost City	The Lost City	Затерянный город	2022-03-25	https://m.media-amazon.com/images/M/MV5BZjA4YmZjMWItZGNkNS00ODFkLWEwNjUtNGNhMzViZDRmMzgxXkEyXkFqcGc@._V1_SX300.jpg	112	13320622	PG-13	комедийный
Fresh	Fresh	Свежий	2022-03-04	https://m.media-amazon.com/images/M/MV5BNjZjOTBhNzgtMGUyMy00ZTJlLWFlMjQtYmMxNGE3YmViYWE5XkEyXkFqcGc@._V1_SX300.jpg	114	13403046	R	комедийный
Beau Is Afraid	Beau Is Afraid	Бо боится	2023-04-21	https://m.media-amazon.com/images/M/MV5BMTdmYmQ5MjctYzU3NS00N2I0LTkwYTYtZWMxNTVhOTRkODA1XkEyXkFqcGc@._V1_SX300.jpg	179	13521006	R	драматичный
The Ice Age Adventures of Buck Wild	The Ice Age Adventures of Buck Wild	Приключения Бака Уайлда в ледниковом периоде	2022-01-28	https://m.media-amazon.com/images/M/MV5BMjhmNDg4NTQtOWNjYi00NjQ0LTgwNzItZDk5Nzk1ZmZlOWEyXkEyXkFqcGc@._V1_SX300.jpg	82	13634480	PG	комедийный
Dobaaraa	Dobaaraa	Добаараа	2022-08-19	https://m.media-amazon.com/images/M/MV5BMGI4ZjVjYzgtNjM5My00YmFmLWE4Y2MtY2I0NTFmYmY0ZDgzXkEyXkFqcGc@._V1_SX300.jpg	132	14042066	N/A	драматичный
Kimi	Kimi	Кими	2022-02-10	https://m.media-amazon.com/images/M/MV5BYjhkNzI4NWItOTFjNi00Y2VjLTkwZTktMjdlNWU0NWViMWI5XkEyXkFqcGc@._V1_SX300.jpg	89	14128670	R	драматичный
The Help	The Help	Помощь	2011-08-10	https://m.media-amazon.com/images/M/MV5BMTM5OTMyMjIxOV5BMl5BanBnXkFtZTcwNzU4MjIwNQ@@._V1_SX300.jpg	146	1454029	PG-13	драматичный
Amphitryon	Amphitryon	Амфитрион	1978-01-07	N/A	125	1807930	N/A	комедийный
12 Angry Men	12 Angry Men	12 разгневанных мужчин	1957-04-10	https://m.media-amazon.com/images/M/MV5BYjE4NzdmOTYtYjc5Yi00YzBiLWEzNDEtNTgxZGQ2MWVkN2NiXkEyXkFqcGc@._V1_SX300.jpg	96	50083	Approved	драматичный
The Lord of the Rings: The Fellowship of the Ring	The Lord of the Rings: The Fellowship of the Ring	Властелин колец: Братство кольца	2001-12-19	https://m.media-amazon.com/images/M/MV5BNzIxMDQ2YTctNDY4MC00ZTRhLTk4ODQtMTVlOWY4NTdiYmMwXkEyXkFqcGc@._V1_SX300.jpg	178	120737	PG-13	драматичный
The Lord of the Rings: The Return of the King	The Lord of the Rings: The Return of the King	Властелин колец: Возвращение короля	2003-12-17	https://m.media-amazon.com/images/M/MV5BMTZkMjBjNWMtZGI5OC00MGU0LTk4ZTItODg2NWM3NTVmNWQ4XkEyXkFqcGc@._V1_SX300.jpg	201	167260	PG-13	драматичный
The Prestige	The Prestige	Престиж	2006-10-20	https://m.media-amazon.com/images/M/MV5BMTM3MzQ5MjQ5OF5BMl5BanBnXkFtZTcwMTQ3NzMzMw@@._V1_SX300.jpg	130	482571	PG-13	драматичный
Gone Girl	Gone Girl	Исчезнувшая	2014-10-03	https://m.media-amazon.com/images/M/MV5BMTk0MDQ3MzAzOV5BMl5BanBnXkFtZTgwNzU1NzE3MjE@._V1_SX300.jpg	149	2267998	R	драматичный
The Martian	The Martian	Марсианин	2015-10-02	https://m.media-amazon.com/images/M/MV5BMTc2MTQ3MDA1Nl5BMl5BanBnXkFtZTgwODA3OTI4NjE@._V1_SX300.jpg	144	3659388	PG-13	драматичный
La La Land	La La Land	Ла-Ла Ленд	2016-12-25	https://m.media-amazon.com/images/M/MV5BMzUzNDM2NzM2MV5BMl5BanBnXkFtZTgwNTM3NTg4OTE@._V1_SX300.jpg	128	3783958	PG-13	драматичный
Moonlight	Moonlight	Лунный свет	2016-11-18	https://m.media-amazon.com/images/M/MV5BNzQxNTIyODAxMV5BMl5BanBnXkFtZTgwNzQyMDA3OTE@._V1_SX300.jpg	111	4975722	R	драматичный
The Big Short	The Big Short	Игра на понижение	2015-12-23	https://m.media-amazon.com/images/M/MV5BZDZkNDQ3YjktYjBlZC00YTY1LTgxOGYtY2RhMWFhZmNkZGY3XkEyXkFqcGc@._V1_SX300.jpg	130	1596363	R	драматичный
It's a Wonderful Life	It's a Wonderful Life	Прекрасная жизнь	1947-01-07	https://m.media-amazon.com/images/M/MV5BMDM4OWFhYjEtNTE5Yy00NjcyLTg5N2UtZDQwNDZlYjlmNDU5XkEyXkFqcGc@._V1_SX300.jpg	130	38650	PG	драматичный
American History X	American History X	Американская история Х	1998-11-20	https://m.media-amazon.com/images/M/MV5BMzhiOTQ0NDItOTg0Zi00OGVmLWE0OGEtMTI4NDM0NWMxZWU4XkEyXkFqcGc@._V1_SX300.jpg	119	120586	R	драматичный
Spider-Man	Spider-Man	Человек-Паук	2002-05-03	https://m.media-amazon.com/images/M/MV5BZWM0OWVmNTEtNWVkOS00MzgyLTkyMzgtMmE2ZTZiNjY4MmFiXkEyXkFqcGc@._V1_SX300.jpg	121	145487	PG-13	экшн
Monsters, Inc.	Monsters, Inc.	Корпорация монстров	2001-11-02	https://m.media-amazon.com/images/M/MV5BMTY1NTI0ODUyOF5BMl5BanBnXkFtZTgwNTEyNjQ0MDE@._V1_SX300.jpg	92	198781	G	комедийный
Harry Potter and the Sorcerer's Stone	Harry Potter and the Sorcerer's Stone	Гарри Поттер и Философский камень	2001-11-16	https://m.media-amazon.com/images/M/MV5BNTU1MzgyMDMtMzBlZS00YzczLThmYWEtMjU3YmFlOWEyMjE1XkEyXkFqcGc@._V1_SX300.jpg	152	241527	PG	экшн
Shrek 2	Shrek 2	Шрек 2	2004-05-19	https://m.media-amazon.com/images/M/MV5BMzNmNjQ1NmUtNzhiZS00YWE2LTg4N2ItZTA2ODdmOTMwOTQ1XkEyXkFqcGc@._V1_SX300.jpg	93	298148	PG	комедийный
The Incredibles	The Incredibles	Суперсемейка	2004-11-05	https://m.media-amazon.com/images/M/MV5BMTY5OTU0OTc2NV5BMl5BanBnXkFtZTcwMzU4MDcyMQ@@._V1_SX300.jpg	115	317705	PG	экшн
Harry Potter and the Goblet of Fire	Harry Potter and the Goblet of Fire	Гарри Поттер и Кубок Огня	2005-11-18	https://m.media-amazon.com/images/M/MV5BMTI1NDMyMjExOF5BMl5BanBnXkFtZTcwOTc4MjQzMQ@@._V1_SX300.jpg	157	330373	PG-13	экшн
Iron Man	Iron Man	Железный Человек	2008-05-02	https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_SX300.jpg	126	371746	PG-13	экшн
Harry Potter and the Order of the Phoenix	Harry Potter and the Order of the Phoenix	Гарри Поттер и Орден феникса	2007-07-11	https://m.media-amazon.com/images/M/MV5BYWJmM2M1YzItMjY1Ni00YzRmLTg5YWYtNDFmNTJjNzQ0ODkyXkEyXkFqcGc@._V1_SX300.jpg	138	373889	PG-13	экшн
Pirates of the Caribbean: At World's End	Pirates of the Caribbean: At World's End	Пираты Карибского моря: На краю света	2007-05-25	https://m.media-amazon.com/images/M/MV5BMjIyNjkxNzEyMl5BMl5BanBnXkFtZTYwMjc3MDE3._V1_SX300.jpg	169	449088	PG-13	экшн
X-Men: Days of Future Past	X-Men: Days of Future Past	Люди Икс: Дни минувшего будущего	2014-05-23	https://m.media-amazon.com/images/M/MV5BNzNiYWE4NjMtMTU4OS00NmM4LWE4ZjAtYmE5OTA5NjkzODExXkEyXkFqcGc@._V1_SX300.jpg	132	1877832	PG-13	экшн
Star Wars: Episode VII - The Force Awakens	Star Wars: Episode VII - The Force Awakens	Звёздные войны: Эпизод VII - Пробуждение силы	2015-12-18	https://m.media-amazon.com/images/M/MV5BOTAzODEzNDAzMl5BMl5BanBnXkFtZTgwMDU1MTgzNzE@._V1_SX300.jpg	138	2488496	PG-13	экшн
Captain America: Civil War	Captain America: Civil War	Первый мститель: Противостояние	2016-05-06	https://m.media-amazon.com/images/M/MV5BMjQ0MTgyNjAxMV5BMl5BanBnXkFtZTgwNjUzMDkyODE@._V1_SX300.jpg	147	3498820	PG-13	экшн
Spider-Man: Into the Spider-Verse	Spider-Man: Into the Spider-Verse	Человек-паук: Через вселенные	2018-12-14	https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_SX300.jpg	117	4633694	PG	экшн
Doctor Strange in the Multiverse of Madness	Doctor Strange in the Multiverse of Madness	Доктор Стрэндж: В мультивселенной безумия	2022-05-06	https://m.media-amazon.com/images/M/MV5BN2YxZGRjMzYtZjE1ZC00MDI0LThjZmQtZTZmMzVmMmQ2NzBmXkEyXkFqcGc@._V1_SX300.jpg	126	9419884	PG-13	экшн
Fast & Furious 6	Fast & Furious 6	Форсаж 6	2013-05-24	https://m.media-amazon.com/images/M/MV5BMTM3NTg2NDQzOF5BMl5BanBnXkFtZTcwNjc2NzQzOQ@@._V1_SX300.jpg	130	1905041	PG-13	экшн
Grave of the Fireflies	Grave of the Fireflies	Могила светлячков	1989-07-26	https://m.media-amazon.com/images/M/MV5BNTY5MmE2OGMtN2IxNC00MDY4LTkwMGEtZDUzOTYyNWE0ZTNjXkEyXkFqcGc@._V1_SX300.jpg	88	95327	Not Rated	драматичный
Cinema Paradiso	Cinema Paradiso	Новый Кинотеатр 'Парадизо'	1990-02-23	https://m.media-amazon.com/images/M/MV5BMTljNzc4YWEtYTZlMS00ODMyLWIwMTAtNWQxY2VkMDEwYTk5XkEyXkFqcGc@._V1_SX300.jpg	174	95765	PG	драматичный
The Whale	The Whale	Кит	2022-12-21	https://m.media-amazon.com/images/M/MV5BYmNhOWMyNTYtNTljNC00NTU3LWFiYmQtMDBhOGU5NWFhNGU5XkEyXkFqcGc@._V1_SX300.jpg	117	13833688	R	драматичный
Cocaine Bear	Cocaine Bear	Кокаиновый медведь	2023-02-24	https://m.media-amazon.com/images/M/MV5BMjg3MmNiNWQtOWI1OS00MjE2LWFhYzYtMWY0NWRhZmVkMGFiXkEyXkFqcGc@._V1_SX300.jpg	95	14209916	R	комедийный
Dune: Part Two	Dune: Part Two	Дюна 2	2024-03-01	https://m.media-amazon.com/images/M/MV5BNTc0YmQxMjEtODI5MC00NjFiLTlkMWUtOGQ5NjFmYWUyZGJhXkEyXkFqcGc@._V1_SX300.jpg	166	15239678	PG-13	драматичный
Fall	Fall	Вышка	2022-08-12	https://m.media-amazon.com/images/M/MV5BYmZjYjAxMDEtOTE2My00MmM5LTkyYjctOWRjMjgyM2JhMDI0XkEyXkFqcGc@._V1_SX300.jpg	107	15325794	PG-13	экшн
Smile	Smile	Улыбка	2022-09-30	https://m.media-amazon.com/images/M/MV5BNjFhMzBlNzktMjE2Ni00YTMyLWI2YWUtYmM1N2QxMDQwZmZhXkEyXkFqcGc@._V1_SX300.jpg	115	15474916	R	экшн
PAW Patrol: The Mighty Movie	PAW Patrol: The Mighty Movie	Щенячий патруль в кино	2023-09-29	https://m.media-amazon.com/images/M/MV5BZTM3NWM4ZTUtYjNhMC00Mzg1LWFmM2QtNGQ0NDg1NzkzYWY4XkEyXkFqcGc@._V1_SX300.jpg	88	15837338	PG	экшн
Air	Air	Air:Большой прыжок	2023-04-05	https://m.media-amazon.com/images/M/MV5BNjdjYzJkZmUtZDNiMC00MzQ0LWE2MGEtYTk4ZGM4NzFkMzM3XkEyXkFqcGc@._V1_SX300.jpg	111	16419074	R	драматичный
Scream VI	Scream VI	Крик 6	2023-03-10	https://m.media-amazon.com/images/M/MV5BZDZkYzk3YTEtYTQ5MS00MzQ5LTg0NjUtOTgzODA5N2EyYTQ1XkEyXkFqcGc@._V1_SX300.jpg	122	17663992	R	экшн
War Horse	War Horse	Боевой конь	2011-12-25	https://m.media-amazon.com/images/M/MV5BMjExNzkxOTYyNl5BMl5BanBnXkFtZTcwODA0MjU4Ng@@._V1_SX300.jpg	146	1568911	PG-13	драматичный
Maleficent	Maleficent	Малефисента	2014-05-30	https://m.media-amazon.com/images/M/MV5BMjAwMzAzMzExOF5BMl5BanBnXkFtZTgwOTcwMDA5MTE@._V1_SX300.jpg	97	1587310	PG	драматичный
Edge of Tomorrow	Edge of Tomorrow	Грань завтрашнего дня	2014-06-06	https://m.media-amazon.com/images/M/MV5BMTc5OTk4MTM3M15BMl5BanBnXkFtZTgwODcxNjg3MDE@._V1_SX300.jpg	113	1631867	PG-13	экшн
In Time	In Time	Во времени	2011-10-28	https://m.media-amazon.com/images/M/MV5BMjA3NzI1ODc1MV5BMl5BanBnXkFtZTcwMzI5NjQwNg@@._V1_SX300.jpg	109	1637688	PG-13	экшн
Cinderella	Cinderella	Золушка	2015-03-13	https://m.media-amazon.com/images/M/MV5BMjMxODYyODEzN15BMl5BanBnXkFtZTgwMDk4OTU0MzE@._V1_SX300.jpg	105	1661199	PG	драматичный
Les Misérables	Les Misérables	Отверженные	2012-12-25	https://m.media-amazon.com/images/M/MV5BY2Q1YjIxZTAtZTU0YS00ZmE5LWEwODEtY2IyYWM2ZTJlOWE1XkEyXkFqcGc@._V1_SX300.jpg	158	1707386	PG-13	драматичный
Bohemian Rhapsody	Bohemian Rhapsody	Богемская рапсодия	2018-11-02	https://m.media-amazon.com/images/M/MV5BMTA2NDc3Njg5NDVeQTJeQWpwZ15BbWU4MDc1NDcxNTUz._V1_SX300.jpg	134	1727824	PG-13	драматичный
Jersey Boys	Jersey Boys	Мальчики из Джерси	2014-06-20	https://m.media-amazon.com/images/M/MV5BMjIyMjA2OTM0NF5BMl5BanBnXkFtZTgwMzY2MTI2MTE@._V1_SX300.jpg	134	1742044	R	драматичный
The Expendables 2	The Expendables 2	Неудержимые 2	2012-08-17	https://m.media-amazon.com/images/M/MV5BMTkwZGYyYzktNmEzMS00ZDkzLTlkMjEtYTdiOWExM2Y2ZjE4XkEyXkFqcGc@._V1_SX300.jpg	103	1764651	R	экшн
Anna Karenina	Anna Karenina	Анна Каренина	2012-09-07	https://m.media-amazon.com/images/M/MV5BMTU0NDgxNDg0NV5BMl5BanBnXkFtZTcwMjE4MzkwOA@@._V1_SX300.jpg	129	1781769	R	драматичный
The Maze Runner	The Maze Runner	Бегущий в лабиринте	2014-09-19	https://m.media-amazon.com/images/M/MV5BMjUyNTA3MTAyM15BMl5BanBnXkFtZTgwOTEyMTkyMjE@._V1_SX300.jpg	113	1790864	PG-13	экшн
Gold	Gold	Золото	2017-01-27	https://m.media-amazon.com/images/M/MV5BNzI1NjI5OTUyM15BMl5BanBnXkFtZTgwOTM4NzY2MDI@._V1_SX300.jpg	120	1800302	R	драматичный
Divergent	Divergent	Дивергент	2014-03-21	https://m.media-amazon.com/images/M/MV5BMTYxMzYwODE4OV5BMl5BanBnXkFtZTgwNDE5MzE2MDE@._V1_SX300.jpg	139	1840309	PG-13	драматичный
The Hunger Games: Catching Fire	The Hunger Games: Catching Fire	Голодные игры: И вспыхнет пламя	2013-11-22	https://m.media-amazon.com/images/M/MV5BMTAyMjQ3OTAxMzNeQTJeQWpwZ15BbWU4MDU0NzA1MzAx._V1_SX300.jpg	146	1951264	PG-13	экшн
The Hunger Games: Mockingjay - Part 1	The Hunger Games: Mockingjay - Part 1	Голодные игры: Сойка-пересмешница. Часть 1	2014-11-21	https://m.media-amazon.com/images/M/MV5BMTcxNDI2NDAzNl5BMl5BanBnXkFtZTgwODM3MTc2MjE@._V1_SX300.jpg	123	1951265	PG-13	экшн
Rush	Rush	Торопиться	2013-09-27	https://m.media-amazon.com/images/M/MV5BMTZhOGQxM2ItNGQyYy00YzE5LWI5MjMtNmMzNGQzNDE1OTUzXkEyXkFqcGc@._V1_SX300.jpg	123	1979320	R	драматичный
Pitch Perfect	Pitch Perfect	Абсолютно точный	2012-10-05	https://m.media-amazon.com/images/M/MV5BMTcyMTMzNzE5N15BMl5BanBnXkFtZTcwNzg5NjM5Nw@@._V1_SX300.jpg	112	1981677	PG-13	комедийный
War Dogs	War Dogs	Боевые собаки	2016-08-19	https://m.media-amazon.com/images/M/MV5BMjEyNzQ0NzM4MV5BMl5BanBnXkFtZTgwMDI0ODM2OTE@._V1_SX300.jpg	114	2005151	R	комедийный
The Finest Hours	The Finest Hours	Лучшие часы	2016-01-29	https://m.media-amazon.com/images/M/MV5BNTY1MDU1NzYzN15BMl5BanBnXkFtZTgwOTA0MDQyNzE@._V1_SX300.jpg	117	2025690	PG-13	драматичный
Inside Llewyn Davis	Inside Llewyn Davis	Внутри Льюина Дэвиса	2014-01-10	https://m.media-amazon.com/images/M/MV5BMjAxNjcyNDQxM15BMl5BanBnXkFtZTgwNzU2NDA0MDE@._V1_SX300.jpg	104	2042568	R	драматичный
Sleepless	Sleepless	Бессонный	2017-01-13	https://m.media-amazon.com/images/M/MV5BNjEwMDAyOTM4OV5BMl5BanBnXkFtZTgwMzc4MjMyMDI@._V1_SX300.jpg	95	2072233	R	экшн
Inside Out	Inside Out	Наизнанку	2015-06-19	https://m.media-amazon.com/images/M/MV5BOTgxMDQwMDk0OF5BMl5BanBnXkFtZTgwNjU5OTg2NDE@._V1_SX300.jpg	95	2096673	PG	комедийный
Dawn of the Planet of the Apes	Dawn of the Planet of the Apes	Рассвет планеты обезьян	2014-07-11	https://m.media-amazon.com/images/M/MV5BNWNjYzQ4ZGItZTg1My00NTM2LTg1NDUtYThjOTQwMTYyNjU1XkEyXkFqcGc@._V1_SX300.jpg	130	2103281	PG-13	драматичный
Hacksaw Ridge	Hacksaw Ridge	Ножовка Ридж	2016-11-04	https://m.media-amazon.com/images/M/MV5BMjQ1NjM3MTUxNV5BMl5BanBnXkFtZTgwMDc5MTY5OTE@._V1_SX300.jpg	139	2119532	R	драматичный
Independence Day: Resurgence	Independence Day: Resurgence	День независимости: возрождение	2016-06-24	https://m.media-amazon.com/images/M/MV5BMjIyMTg5MTg4OV5BMl5BanBnXkFtZTgwMzkzMjY5NzE@._V1_SX300.jpg	120	1628841	PG-13	экшн
The Twilight Saga: Breaking Dawn - Part 2	The Twilight Saga: Breaking Dawn - Part 2	Сумерки. Сага. Рассвет. Часть 2.	2012-11-16	https://m.media-amazon.com/images/M/MV5BMTcyMzUyMzY1OF5BMl5BanBnXkFtZTcwNDQ4ODk1OA@@._V1_SX300.jpg	115	1673434	PG-13	драматичный
Detachment	Detachment	Отряд	2012-02-01	https://m.media-amazon.com/images/M/MV5BMTM3NzQzMDA5Ml5BMl5BanBnXkFtZTcwODA5NTcyNw@@._V1_SX300.jpg	98	1683526	Not Rated	драматичный
Ender's Game	Ender's Game	Игра Эндера	2013-11-01	https://m.media-amazon.com/images/M/MV5BMjAzMzI5OTgzMl5BMl5BanBnXkFtZTgwMTU5MTAwMDE@._V1_SX300.jpg	114	1731141	PG-13	экшн
Wreck-It Ralph	Wreck-It Ralph	Wreck-It Ральф	2012-11-02	https://m.media-amazon.com/images/M/MV5BNzMxNTExOTkyMF5BMl5BanBnXkFtZTcwMzEyNDc0OA@@._V1_SX300.jpg	101	1772341	PG	комедийный
Blade Runner 2049	Blade Runner 2049	Бегущий по лезвию 2049	2017-10-06	https://m.media-amazon.com/images/M/MV5BNzA1Njg4NzYxOV5BMl5BanBnXkFtZTgwODk5NjU3MzI@._V1_SX300.jpg	164	1856101	R	драматичный
American Sniper	American Sniper	Американский снайпер	2015-01-16	https://m.media-amazon.com/images/M/MV5BMTkxNzI3ODI4Nl5BMl5BanBnXkFtZTgwMjkwMjY4MjE@._V1_SX300.jpg	133	2179136	R	драматичный
Blue Is the Warmest Colour	Blue Is the Warmest Colour	Синий — самый теплый цвет	2013-10-09	https://m.media-amazon.com/images/M/MV5BMTQ5NTg5ODk4OV5BMl5BanBnXkFtZTgwODc4MTMzMDE@._V1_SX300.jpg	180	2278871	NC-17	драматичный
Minions	Minions	Миньоны	2015-07-10	https://m.media-amazon.com/images/M/MV5BODI4NzMyNjE0MF5BMl5BanBnXkFtZTgwMTcwNzI0MzE@._V1_SX300.jpg	91	2293640	PG	комедийный
The 5th Wave	The 5th Wave	5-я волна	2016-01-22	https://m.media-amazon.com/images/M/MV5BMjQwOTc0Mzg3Nl5BMl5BanBnXkFtZTgwOTg3NjI2NzE@._V1_SX300.jpg	112	2304933	PG-13	экшн
The Hobbit: The Battle of the Five Armies	The Hobbit: The Battle of the Five Armies	Хоббит: Битва пяти воинств	2014-12-17	https://m.media-amazon.com/images/M/MV5BMTYzNDE3OTQ3MF5BMl5BanBnXkFtZTgwODczMTg4MjE@._V1_SX300.jpg	144	2310332	R	экшн
Fifty Shades of Grey	Fifty Shades of Grey	Пятьдесят оттенков серого	2015-02-13	https://m.media-amazon.com/images/M/MV5BMjE1MTM4NDAzOF5BMl5BanBnXkFtZTgwNTMwNjI0MzE@._V1_SX300.jpg	125	2322441	R	драматичный
Blue Jasmine	Blue Jasmine	Голубой Жасмин	2013-08-23	https://m.media-amazon.com/images/M/MV5BMTc0ODk5MzEyMV5BMl5BanBnXkFtZTcwMzI0MDY1OQ@@._V1_SX300.jpg	98	2334873	PG-13	драматичный
The Mummy	The Mummy	Мумия	2017-06-09	https://m.media-amazon.com/images/M/MV5BMTkwMTgwODAxMl5BMl5BanBnXkFtZTgwNTEwNTQ3MDI@._V1_SX300.jpg	110	2345759	PG-13	экшн
Spectre	Spectre	Призрак	2015-11-06	https://m.media-amazon.com/images/M/MV5BMzA5MzFiNDAtYTI0NC00MDE5LTljYTctYTNkODk1OTZlODI5XkEyXkFqcGc@._V1_SX300.jpg	148	2379713	PG-13	экшн
Mission: Impossible - Rogue Nation	Mission: Impossible - Rogue Nation	Миссия невыполнима: Племя изгоев	2015-07-31	https://m.media-amazon.com/images/M/MV5BZjUwZjg2ZjAtY2RhZi00YmZjLTlhNGQtOWQwNDk1MjhhM2NhXkEyXkFqcGc@._V1_SX300.jpg	131	2381249	PG-13	экшн
The Magnificent Seven	The Magnificent Seven	Великолепная семерка	2016-09-23	https://m.media-amazon.com/images/M/MV5BMTUzNTc0NTAyM15BMl5BanBnXkFtZTgwMTk1ODA5OTE@._V1_SX300.jpg	132	2404435	PG-13	драматичный
Wonder	Wonder	Удивляться	2017-11-17	https://m.media-amazon.com/images/M/MV5BYmFkYTlhNWUtMzliMS00ODIyLThlMmUtOGQ0N2RmOTg4YjJiXkEyXkFqcGc@._V1_SX300.jpg	113	2543472	PG	драматичный
Hell or High Water	Hell or High Water	Ад или паводок	2016-08-26	https://m.media-amazon.com/images/M/MV5BMTg4NDA1OTA5NF5BMl5BanBnXkFtZTgwMDQ2MDM5ODE@._V1_SX300.jpg	102	2582782	R	драматичный
Jojo Rabbit	Jojo Rabbit	Кролик Джоджо	2019-11-08	https://m.media-amazon.com/images/M/MV5BYmFmNmUyMjYtZTFjNS00OWQyLThhZmMtMGZkYTQ3YjY0ZDQ1XkEyXkFqcGc@._V1_SX300.jpg	108	2584384	PG-13	драматичный
Me Before You	Me Before You	Я перед тобой	2016-06-03	https://m.media-amazon.com/images/M/MV5BMTQ2NjE4NDE2NV5BMl5BanBnXkFtZTgwOTcwNDE5NzE@._V1_SX300.jpg	110	2674426	PG-13	драматичный
The Secret Life of Pets	The Secret Life of Pets	Тайная жизнь домашних животных	2016-07-08	https://m.media-amazon.com/images/M/MV5BMjIzMzA1OTkzNV5BMl5BanBnXkFtZTgwODE3MjM4NzE@._V1_SX300.jpg	86	2709768	PG	комедийный
T2 Trainspotting	T2 Trainspotting	Т2 Трейнспоттинг	2017-03-31	https://m.media-amazon.com/images/M/MV5BMjI0MTE1ODkzMl5BMl5BanBnXkFtZTgwMTQ1MTg5MDI@._V1_SX300.jpg	117	2763304	R	драматичный
The Interview	The Interview	Интервью	2014-12-24	https://m.media-amazon.com/images/M/MV5BMTQzMTcwMzgyMV5BMl5BanBnXkFtZTgwMzAyMzQ2MzE@._V1_SX300.jpg	112	2788710	R	комедийный
Kingsman: The Secret Service	Kingsman: The Secret Service	Кингсман: Секретная служба	2015-02-13	https://m.media-amazon.com/images/M/MV5BODk1MTYwNTAtYmI5Zi00OWYyLWE0MzQtOWE4NDIxZmU2MjMwXkEyXkFqcGc@._V1_SX300.jpg	129	2802144	R	комедийный
Zootopia	Zootopia	Зверополис	2016-03-04	https://m.media-amazon.com/images/M/MV5BOTMyMjEyNzIzMV5BMl5BanBnXkFtZTgwNzIyNjU0NzE@._V1_SX300.jpg	108	2948356	PG	экшн
Batman v Superman: Dawn of Justice	Batman v Superman: Dawn of Justice	Бэтмен против Супермена: На заре справедливости	2016-03-25	https://m.media-amazon.com/images/M/MV5BZTJkYjdmYjYtOGMyNC00ZGU1LThkY2ItYTc1OTVlMmE2YWY1XkEyXkFqcGc@._V1_SX300.jpg	151	2975590	R	экшн
The Theory of Everything	The Theory of Everything	Теория всего	2014-11-26	https://m.media-amazon.com/images/M/MV5BMTAwMTU4MDA3NDNeQTJeQWpwZ15BbWU4MDk4NTMxNTIx._V1_SX300.jpg	123	2980516	PG-13	драматичный
Wild Tales	Wild Tales	Дикие сказки	2014-08-21	https://m.media-amazon.com/images/M/MV5BNzAzMjA1ODAxOV5BMl5BanBnXkFtZTgwODg4NTQzNDE@._V1_SX300.jpg	122	3011894	R	драматичный
The Jungle Book	The Jungle Book	Книга джунглей	2016-04-15	https://m.media-amazon.com/images/M/MV5BMTc3NTUzNTI4MV5BMl5BanBnXkFtZTgwNjU0NjU5NzE@._V1_SX300.jpg	106	3040964	PG	экшн
The Conjuring 2	The Conjuring 2	Заклятие 2	2016-06-10	https://m.media-amazon.com/images/M/MV5BOTRkMDlmZWEtMzQyYy00YzgyLTgwM2QtNzgxYmIwNGVlYmJlXkEyXkFqcGc@._V1_SX300.jpg	134	3065204	R	экшн
Creed	Creed	Крид	2015-11-25	https://m.media-amazon.com/images/M/MV5BNWM3NjY2ZDctMGZiYy00OGFlLThkMTktOTY2MDM2YjE2OTliXkEyXkFqcGc@._V1_SX300.jpg	133	3076658	PG-13	драматичный
Now You See Me 2	Now You See Me 2	Теперь ты видишь меня 2	2016-06-10	https://m.media-amazon.com/images/M/MV5BOTVjNTA0ZWEtNzU2Ny00Njg1LWE1MmEtZTUyZGQzYTVlY2Q5XkEyXkFqcGc@._V1_SX300.jpg	129	3110958	PG-13	комедийный
Fantastic Beasts and Where to Find Them	Fantastic Beasts and Where to Find Them	Фантастические звери и где их найти	2016-11-18	https://m.media-amazon.com/images/M/MV5BMjMxOTM1OTI4MV5BMl5BanBnXkFtZTgwODE5OTYxMDI@._V1_SX300.jpg	132	3183660	PG-13	экшн
Sully	Sully	Салли	2016-09-09	https://m.media-amazon.com/images/M/MV5BYzM5ODA5MDItZGM4MS00YmQ3LTkxMDUtMDY2NjcyM2RmYzlkXkEyXkFqcGc@._V1_SX300.jpg	96	3263904	PG-13	драматичный
Sing	Sing	Петь	2016-12-21	https://m.media-amazon.com/images/M/MV5BMTYzODYzODU2Ml5BMl5BanBnXkFtZTgwNTc1MTA2NzE@._V1_SX300.jpg	108	3470600	PG	комедийный
Moana	Moana	Моана	2016-11-23	https://m.media-amazon.com/images/M/MV5BMjI4MzU5NTExNF5BMl5BanBnXkFtZTgwNzY1MTEwMDI@._V1_SX300.jpg	107	3521164	PG	комедийный
Captain Fantastic	Captain Fantastic	Капитан Фантастик	2016-07-29	https://m.media-amazon.com/images/M/MV5BMjE5OTM0OTY5NF5BMl5BanBnXkFtZTgwMDcxOTQ3ODE@._V1_SX300.jpg	118	3553976	R	драматичный
Incredibles 2	Incredibles 2	Суперсемейка 2	2018-06-15	https://m.media-amazon.com/images/M/MV5BMTEzNzY0OTg0NTdeQTJeQWpwZ15BbWU4MDU3OTg3MjUz._V1_SX300.jpg	118	3606756	PG	экшн
Allied	Allied	Союзник	2016-11-23	https://m.media-amazon.com/images/M/MV5BNWJiOTUzODItNTYzYS00NGY0LWIzZmEtZDA4MGI5ZWMxMjM2XkEyXkFqcGc@._V1_SX300.jpg	124	3640424	R	драматичный
The One and Only Ivan	The One and Only Ivan	Единственный и неповторимый Иван	2020-08-21	https://m.media-amazon.com/images/M/MV5BYTdhMWViYWMtMjJiZS00M2ZjLWE4Y2YtZjgxMmM5ODA1OGZhXkEyXkFqcGc@._V1_SX300.jpg	95	3661394	PG	драматичный
Bridge of Spies	Bridge of Spies	Мост шпионов	2015-10-16	https://m.media-amazon.com/images/M/MV5BMjIxOTI0MjU5NV5BMl5BanBnXkFtZTgwNzM4OTk4NTE@._V1_SX300.jpg	142	3682448	PG-13	драматичный
Kong: Skull Island	Kong: Skull Island	Конг: Остров Черепа	2017-03-10	https://m.media-amazon.com/images/M/MV5BMTcwMjcxYTQtYjJlOS00YTE1LWIyZGYtOGRlOTBlMWZmYTliXkEyXkFqcGc@._V1_SX300.jpg	118	3731562	PG-13	экшн
Godzilla: King of the Monsters	Godzilla: King of the Monsters	Годзилла: Король монстров	2019-05-31	https://m.media-amazon.com/images/M/MV5BMDVhMjk2OGUtYzYxNS00NzBjLTk5YTItYzI0ZjgzNjY1NmI0XkEyXkFqcGc@._V1_SX300.jpg	132	3741700	PG-13	экшн
Savageland	Savageland	Дикарьленд	2017-02-24	https://m.media-amazon.com/images/M/MV5BNzZkMDc4MDAtYTQwNC00MmM5LTljZjktNjc2ZmQ4MmMyMDg0XkEyXkFqcGc@._V1_SX300.jpg	82	3899154	Not Rated	экшн
The Handmaiden	The Handmaiden	Служанка	2017-09-02	https://m.media-amazon.com/images/M/MV5BOTllZDI1OGItOGUxNS00OGZhLWIzMjAtYzllZTY1YTA0ZmYwXkEyXkFqcGc@._V1_SX300.jpg	145	4016934	Not Rated	драматичный
Manchester by the Sea	Manchester by the Sea	Манчестер у моря	2016-12-16	https://m.media-amazon.com/images/M/MV5BMTYxMjk0NDg4Ml5BMl5BanBnXkFtZTgwODcyNjA5OTE@._V1_SX300.jpg	137	4034228	R	драматичный
Maze Runner: The Scorch Trials	Maze Runner: The Scorch Trials	Бегущий в лабиринте: Испытания огнём	2015-09-18	https://m.media-amazon.com/images/M/MV5BMjE3MDU2NzQyMl5BMl5BanBnXkFtZTgwMzQxMDQ3NTE@._V1_SX300.jpg	131	4046784	PG-13	экшн
Green Room	Green Room	Зеленая комната	2016-05-13	https://m.media-amazon.com/images/M/MV5BMjU1ODQ5NzA0N15BMl5BanBnXkFtZTgwMDg5MTA5NzE@._V1_SX300.jpg	95	4062536	R	страшный
The Lego Batman Movie	The Lego Batman Movie	Лего Фильм Бэтмен	2017-02-10	https://m.media-amazon.com/images/M/MV5BMTcyNTEyOTY0M15BMl5BanBnXkFtZTgwOTAyNzU3MDI@._V1_SX300.jpg	104	4116284	PG	экшн
The Gift	The Gift	Подарок	2015-08-07	https://m.media-amazon.com/images/M/MV5BOTNlZmJiNGUtZGEwNC00MzE1LTkzNTItNGQ0NGRkYjhiYTNmXkEyXkFqcGc@._V1_SX300.jpg	108	4178092	R	драматичный
Jason Bourne	Jason Bourne	Джейсон Борн	2016-07-29	https://m.media-amazon.com/images/M/MV5BMzY3Y2Q3MmUtZmU3MC00OWMxLWIwNDMtNDA4MmViMTUxYjYxXkEyXkFqcGc@._V1_SX300.jpg	123	4196776	PG-13	экшн
Widows	Widows	Вдовы	2018-11-16	https://m.media-amazon.com/images/M/MV5BMjM3ODc5NDEyOF5BMl5BanBnXkFtZTgwMTI4MDcxNjM@._V1_SX300.jpg	129	4218572	R	драматичный
John Wick: Chapter 2	John Wick: Chapter 2	Джон Уик: Глава 2	2017-02-10	https://m.media-amazon.com/images/M/MV5BMjE2NDkxNTY2M15BMl5BanBnXkFtZTgwMDc2NzE0MTI@._V1_SX300.jpg	122	4425200	R	экшн
Batman Unlimited: Animal Instincts	Batman Unlimited: Animal Instincts	Бэтмен без границ: Инстинкты животных	2015-05-12	https://m.media-amazon.com/images/M/MV5BMTQ2NTAyNDY0NF5BMl5BanBnXkFtZTgwMjc0Mzc1NTE@._V1_SX300.jpg	78	4437640	Not Rated	экшн
Shaft	Shaft	Вал	2019-06-14	https://m.media-amazon.com/images/M/MV5BNWUzNjIxY2EtNGNjMC00N2U1LTk1YzItMzUwOWIzOTc1OGRjXkEyXkFqcGc@._V1_SX300.jpg	111	4463894	R	комедийный
Fifty Shades Freed	Fifty Shades Freed	Пятьдесят оттенков свободы	2018-02-09	https://m.media-amazon.com/images/M/MV5BMTYxOTQ1MzI0Nl5BMl5BanBnXkFtZTgwMzgwMzIxNDM@._V1_SX300.jpg	105	4477536	R	драматичный
Nocturnal Animals	Nocturnal Animals	Ночные животные	2016-12-09	https://m.media-amazon.com/images/M/MV5BMTYwMzMwMzgxNl5BMl5BanBnXkFtZTgwMTA0MTUzMDI@._V1_SX300.jpg	116	4550098	R	драматичный
Christopher Robin	Christopher Robin	Кристофер Робин	2018-08-03	https://m.media-amazon.com/images/M/MV5BMjAzOTM2OTAyNF5BMl5BanBnXkFtZTgwNTg5ODg1NTM@._V1_SX300.jpg	104	4575576	PG	драматичный
On the Basis of Sex	On the Basis of Sex	По признаку пола	2019-01-11	https://m.media-amazon.com/images/M/MV5BZDMyOWY1ODEtNjQwMy00ZjE3LTliMjQtZWM4YTk3OTM1Y2Y0XkEyXkFqcGc@._V1_SX300.jpg	120	4669788	PG-13	драматичный
Bumblebee	Bumblebee	Шмель	2018-12-21	https://m.media-amazon.com/images/M/MV5BMjUwNjU5NDMyNF5BMl5BanBnXkFtZTgwNzgxNjM2NzM@._V1_SX300.jpg	114	4701182	PG-13	экшн
The Meg	The Meg	Мэг	2018-08-10	https://m.media-amazon.com/images/M/MV5BMWZjYjgxMzEtYTE1MS00M2RlLWJjOTUtZDA5ODM2YWQ4Y2FhXkEyXkFqcGc@._V1_SX300.jpg	113	4779682	PG-13	экшн
Hidden Figures	Hidden Figures	Скрытые фигуры	2017-01-06	https://m.media-amazon.com/images/M/MV5BY2RhNDRhNzctZTllMy00NTc2LWJjZmUtMzg3MTNiNjhhODMxXkEyXkFqcGc@._V1_SX300.jpg	127	4846340	PG	драматичный
Dunkirk	Dunkirk	Дюнкерк	2017-07-21	https://m.media-amazon.com/images/M/MV5BZWU5ZjJkNTQtMzQwOS00ZGE4LWJkMWUtMGQ5YjdiM2FhYmRhXkEyXkFqcGc@._V1_SX300.jpg	106	5013056	PG-13	драматичный
Three Billboards Outside Ebbing, Missouri	Three Billboards Outside Ebbing, Missouri	Три рекламных щита на окраине Эббинга, штат Миссури	2017-12-01	https://m.media-amazon.com/images/M/MV5BMjI0ODcxNzM1N15BMl5BanBnXkFtZTgwMzIwMTEwNDI@._V1_SX300.jpg	115	5027774	R	драматичный
The Secret Life of Pets 2	The Secret Life of Pets 2	Тайная жизнь домашних животных 2	2019-06-07	https://m.media-amazon.com/images/M/MV5BMTA2NzM0MjA0MTJeQTJeQWpwZ15BbWU4MDk1MzYwNzYz._V1_SX300.jpg	86	5113040	PG	комедийный
Ocean's Eight	Ocean's Eight	Восемь Оушена	2018-06-08	https://m.media-amazon.com/images/M/MV5BMjAyNDEyMzc4Ml5BMl5BanBnXkFtZTgwMjEzNjM0NTM@._V1_SX300.jpg	110	5164214	PG-13	комедийный
Love, Simon	Love, Simon	С любовью, Саймон	2018-03-16	https://m.media-amazon.com/images/M/MV5BN2ViMjNkMDMtY2MwZC00YzRiLWJlY2UtNjU0YzNmMDc3NzkxXkEyXkFqcGc@._V1_SX300.jpg	110	5164432	PG-13	драматичный
The Salesman	The Salesman	Продавец	2016-08-31	https://m.media-amazon.com/images/M/MV5BMTg2MTc0ODEwOV5BMl5BanBnXkFtZTgwNDAyOTY1MDI@._V1_SX300.jpg	124	5186714	PG-13	драматичный
A Silent Voice: The Movie	A Silent Voice: The Movie	Тихий голос: Фильм	2016-09-17	https://m.media-amazon.com/images/M/MV5BOTFiNzRiOWEtYTQwNy00NmRiLWE0ZWYtNTE0YjExZjFmZjkwXkEyXkFqcGc@._V1_SX300.jpg	130	5323662	Not Rated	драматичный
Call Me by Your Name	Call Me by Your Name	Назови меня своим именем	2018-01-19	https://m.media-amazon.com/images/M/MV5BNDk3NTEwNjc0MV5BMl5BanBnXkFtZTgwNzYxNTMwMzI@._V1_SX300.jpg	132	5726616	R	драматичный
The Nun	The Nun	Монахиня	2018-09-07	https://m.media-amazon.com/images/M/MV5BMjM3NzQ5NDcxOF5BMl5BanBnXkFtZTgwNzM4MTQ5NTM@._V1_SX300.jpg	96	5814060	R	экшн
Pokémon: Detective Pikachu	Pokémon: Detective Pikachu	Покемон: Детектив Пикачу	2019-05-10	https://m.media-amazon.com/images/M/MV5BNDU4Mzc3NzE5NV5BMl5BanBnXkFtZTgwMzE1NzI1NzM@._V1_SX300.jpg	104	5884052	PG	комедийный
Aladdin	Aladdin	Аладдин	2019-05-24	https://m.media-amazon.com/images/M/MV5BMjQ2ODIyMjY4MF5BMl5BanBnXkFtZTgwNzY4ODI2NzM@._V1_SX300.jpg	128	6139732	PG	комедийный
Spider-Man: Far from Home	Spider-Man: Far from Home	Человек-Паук: Вдали от дома	2019-07-02	https://m.media-amazon.com/images/M/MV5BMzNhNTE0NWQtN2E1Ny00NjcwLTg1YTctMGY1NmMwODJmY2NmXkEyXkFqcGc@._V1_SX300.jpg	129	6320628	PG-13	комедийный
Terminator: Dark Fate	Terminator: Dark Fate	Терминатор: Темная судьба	2019-11-01	https://m.media-amazon.com/images/M/MV5BOTU2OGFhYjktNDJhMC00NmU5LWE1OWItNzg5ODU1MzdmNTZkXkEyXkFqcGc@._V1_SX300.jpg	128	6450804	R	экшн
A Quiet Place	A Quiet Place	Тихое место	2018-04-06	https://m.media-amazon.com/images/M/MV5BMjI0MDMzNTQ0M15BMl5BanBnXkFtZTgwMTM5NzM3NDM@._V1_SX300.jpg	90	6644200	PG-13	драматичный
Us	Us	Нас	2019-03-22	https://m.media-amazon.com/images/M/MV5BMzhkMjFkN2YtODU2Ni00YWYwLWExN2MtOWNjZmQxM2U4YTM5XkEyXkFqcGc@._V1_SX300.jpg	116	6857112	R	экшн
Green Book	Green Book	Зеленая книга	2018-11-16	https://m.media-amazon.com/images/M/MV5BNDU5YTNmMmItN2QxNy00OGQ0LTg5MTctNzFmYjEzZjcwN2UwXkEyXkFqcGc@._V1_SX300.jpg	130	6966692	PG-13	драматичный
Once Upon a Time... in Hollywood	Once Upon a Time... in Hollywood	Однажды... в Голливуде	2019-07-26	https://m.media-amazon.com/images/M/MV5BMzMzNmViNjYtN2ViNi00NDM3LWFlMmItNDYyMGIzY2EzZjE2XkEyXkFqcGc@._V1_SX300.jpg	161	7131622	R	драматичный
BlacKkKlansman	BlacKkKlansman	ЧерныйКкКлановец	2018-08-10	https://m.media-amazon.com/images/M/MV5BMjUyOTE1NjI0OF5BMl5BanBnXkFtZTgwMTM4ODQ5NTM@._V1_SX300.jpg	135	7349662	R	комедийный
Marriage Story	Marriage Story	История брака	2019-12-06	https://m.media-amazon.com/images/M/MV5BNmE0OWJlM2MtNzhmMi00YmQyLTlmY2EtZmUzNzBiNGRlN2JkXkEyXkFqcGc@._V1_SX300.jpg	137	7653254	R	драматичный
Free Solo	Free Solo	Бесплатное соло	2018-12-13	https://m.media-amazon.com/images/M/MV5BMjA2YTAxMzMtNzA2Mi00NTcyLTg4NzUtODIxYzFiYzdiNWNlXkEyXkFqcGc@._V1_SX300.jpg	100	7775622	PG-13	экшн
The Mitchells vs. the Machines	The Mitchells vs. the Machines	Митчеллы против машин	2021-04-30	https://m.media-amazon.com/images/M/MV5BNzAyOWNiMjAtNWUzMi00ZDk1LWE5NzYtNDUzMWE1Y2M0NDM2XkEyXkFqcGc@._V1_SX300.jpg	114	7979580	PG	комедийный
Yesterday	Yesterday	Вчера	2019-06-28	https://m.media-amazon.com/images/M/MV5BMjQ0NTI0NjkyN15BMl5BanBnXkFtZTgwNzY0MTE0NzM@._V1_SX300.jpg	116	8079248	PG-13	комедийный
The Bad Guys	The Bad Guys	Плохие парни	2022-04-22	https://m.media-amazon.com/images/M/MV5BODNlYmQzY2MtZWZiZS00Y2I0LTkwNjItNjg3MjY5YTFkNWI3XkEyXkFqcGc@._V1_SX300.jpg	100	8115900	PG	комедийный
Doom: Annihilation	Doom: Annihilation	Дум: Аннигиляция	2019-10-01	https://m.media-amazon.com/images/M/MV5BN2NlMzA0ZmEtMzdkNS00MjY2LTkzMjctZmFlODRjMDA1MTE0XkEyXkFqcGc@._V1_SX300.jpg	96	8328716	R	экшн
Midsommar	Midsommar	Мидсоммар	2019-07-03	https://m.media-amazon.com/images/M/MV5BMzQxNzQzOTQwM15BMl5BanBnXkFtZTgwMDQ2NTcwODM@._V1_SX300.jpg	148	8772262	R	драматичный
Knives Out	Knives Out	Ножи наружу	2019-11-27	https://m.media-amazon.com/images/M/MV5BZDU5ZTRkYmItZjg0Mi00ZTQwLThjMWItNWM3MTMxMzVjZmVjXkEyXkFqcGc@._V1_SX300.jpg	130	8946378	PG-13	драматичный
Adopt a Highway	Adopt a Highway	Принять шоссе	2019-11-01	https://m.media-amazon.com/images/M/MV5BMWVlOTQ3ZGUtNzgwNS00YmI5LWE3ZGUtMWNmNWE3YTRiYmU5XkEyXkFqcGc@._V1_SX300.jpg	81	8970448	Not Rated	драматичный
The Green Knight	The Green Knight	Зеленый рыцарь	2021-07-30	https://m.media-amazon.com/images/M/MV5BNjRjNmU1M2ItNDU4Ni00ZGY2LTlmNzItY2MxYmY3OTllZjMwXkEyXkFqcGc@._V1_SX300.jpg	130	9243804	R	драматичный
Nomadland	Nomadland	Страна Кочевников	2021-02-19	https://m.media-amazon.com/images/M/MV5BZGNkOWQ0ZjMtMTc4Ny00NDRhLTgyMjUtNzFmZDM0MTc3N2JjXkEyXkFqcGc@._V1_SX300.jpg	107	9770150	R	драматичный
Marry Me	Marry Me	Выходи за меня	2022-02-11	https://m.media-amazon.com/images/M/MV5BMjM4NjJlZjAtNGI4OS00MDNhLWJkYjItZTY0NjcwZjg0NDRmXkEyXkFqcGc@._V1_SX300.jpg	112	10223460	PG-13	комедийный
John Wick: Chapter 4	John Wick: Chapter 4	Джон Уик: Глава 4	2023-03-24	https://m.media-amazon.com/images/M/MV5BY2Q2ZmI5ZjUtNWVhMC00YzJkLTlmYjMtY2RmZDhkNzEzYjZhXkEyXkFqcGc@._V1_SX300.jpg	169	10366206	R	экшн
Nope	Nope	Неа	2022-07-22	https://m.media-amazon.com/images/M/MV5BODRlNWRhZWUtMzdlZC00ZDIyLWFhZjMtYTcxNjI1ZDIwODhjXkEyXkFqcGc@._V1_SX300.jpg	130	10954984	R	страшный
Glass Onion	Glass Onion	Стеклянный лук	2022-12-23	https://m.media-amazon.com/images/M/MV5BMzI2ZDYxZTEtMzVlOC00OTUyLTgyNTAtYWFhNmRhZjAzZWE1XkEyXkFqcGc@._V1_SX300.jpg	139	11564570	PG-13	драматичный
Ghajini	Ghajini	Гаджини	2008-12-24	https://m.media-amazon.com/images/M/MV5BMjk3ZmQyYjAtZTgwZS00YjliLTljZmEtMDU1Nzk1Y2NhYmRlXkEyXkFqcGc@._V1_SX300.jpg	186	1166100	Not Rated	экшн
The Hobbit: The Desolation of Smaug	The Hobbit: The Desolation of Smaug	Хоббит: Пустошь Смауга	2013-12-13	https://m.media-amazon.com/images/M/MV5BMzU0NDY0NDEzNV5BMl5BanBnXkFtZTgwOTIxNDU1MDE@._V1_SX300.jpg	161	1170358	PG-13	экшн
A Walk in the Woods	A Walk in the Woods	Прогулка по лесу	2015-09-02	https://m.media-amazon.com/images/M/MV5BMTU2MTkwMzM0NF5BMl5BanBnXkFtZTgwMjA0NDA4NTE@._V1_SX300.jpg	104	1178665	R	комедийный
2012	2012	2012 год	2009-11-13	https://m.media-amazon.com/images/M/MV5BMTY0MjEyODQzMF5BMl5BanBnXkFtZTcwMTczMjQ4Mg@@._V1_SX300.jpg	158	1190080	PG-13	экшн
Rango	Rango	Ранго	2011-03-04	https://m.media-amazon.com/images/M/MV5BMTc4NjEyODE1OV5BMl5BanBnXkFtZTcwMjYzNTkxNA@@._V1_SX300.jpg	107	1192628	PG	экшн
Up in the Air	Up in the Air	В воздухе	2009-12-23	https://m.media-amazon.com/images/M/MV5BMTI3MzYxMTA4NF5BMl5BanBnXkFtZTcwMDE4ODg3Mg@@._V1_SX300.jpg	109	1193138	R	драматичный
Step Up 3D	Step Up 3D	Шаг вперед 3D	2010-08-06	https://m.media-amazon.com/images/M/MV5BMTcxNDU2NTE4Nl5BMl5BanBnXkFtZTcwNzQ1MTEzMw@@._V1_SX300.jpg	107	1193631	PG-13	драматичный
The Bourne Legacy	The Bourne Legacy	Наследие Борна	2012-08-10	https://m.media-amazon.com/images/M/MV5BMTc4Njk3MDM1Nl5BMl5BanBnXkFtZTcwODgyOTMxOA@@._V1_SX300.jpg	135	1194173	PG-13	экшн
Get Low	Get Low	Опуститься	2010-08-27	https://m.media-amazon.com/images/M/MV5BMTY3MjUxNDUwNl5BMl5BanBnXkFtZTcwNzk1NDk1Mw@@._V1_SX300.jpg	103	1194263	PG-13	драматичный
Murder.com	Murder.com	Убийство.com	2018-05-24	https://m.media-amazon.com/images/M/MV5BMjA5ODc0OTU3M15BMl5BanBnXkFtZTcwNTAzNzc5MQ@@._V1_SX300.jpg	85	1194606	R	драматичный
Crazy on the Outside	Crazy on the Outside	Сумасшедший снаружи	2010-01-08	https://m.media-amazon.com/images/M/MV5BMTgzMjgzNjcyNF5BMl5BanBnXkFtZTcwNjQ0OTEwMw@@._V1_SX300.jpg	96	1196134	PG-13	комедийный
Charlie Countryman	Charlie Countryman	Чарли Кантримэн	2013-09-13	https://m.media-amazon.com/images/M/MV5BMjA3MTcyNjk3NF5BMl5BanBnXkFtZTgwNjkzNzUzMDE@._V1_SX300.jpg	103	1196948	R	драматичный
Law Abiding Citizen	Law Abiding Citizen	Законопослушный гражданин	2009-10-16	https://m.media-amazon.com/images/M/MV5BNDFjNzM2NzMtNTkxZi00ZGFmLTkyZGMtZWQ3ZjMwZDc5NDExXkEyXkFqcGc@._V1_SX300.jpg	109	1197624	R	драматичный
Observe and Report	Observe and Report	Наблюдайте и сообщайте	2009-04-10	https://m.media-amazon.com/images/M/MV5BMTc0NDY4MDA5M15BMl5BanBnXkFtZTgwNTQyMzcwMzE@._V1_SX300.jpg	86	1197628	R	комедийный
Harry Potter and the Deathly Hallows: Part 2	Harry Potter and the Deathly Hallows: Part 2	Гарри Поттер и Дары Смерти: Часть 2	2011-07-15	https://m.media-amazon.com/images/M/MV5BOTA1Mzc2N2ItZWRiNS00MjQzLTlmZDQtMjU0NmY1YWRkMGQ4XkEyXkFqcGc@._V1_SX300.jpg	130	1201607	PG-13	экшн
Gran Torino	Gran Torino	Гран Торино	2009-01-09	https://m.media-amazon.com/images/M/MV5BMTc5NTk2OTU1Nl5BMl5BanBnXkFtZTcwMDc3NjAwMg@@._V1_SX300.jpg	116	1205489	R	драматичный
Moneyball	Moneyball	Манибол	2011-09-23	https://m.media-amazon.com/images/M/MV5BMjAxOTU3Mzc1M15BMl5BanBnXkFtZTcwMzk1ODUzNg@@._V1_SX300.jpg	133	1210166	PG-13	драматичный
Don't Look Up	Don't Look Up	Не смотри вверх	2021-12-24	https://m.media-amazon.com/images/M/MV5BMjhhNWFjNzctYTJjOS00MDc0LThiNjItZmM0ZDVmMWViY2UzXkEyXkFqcGc@._V1_SX300.jpg	138	11286314	R	драматичный
Dune: Part One	Dune: Part One	Дюна: Часть первая	2021-10-22	https://m.media-amazon.com/images/M/MV5BNWIyNmU5MGYtZDZmNi00ZjAwLWJlYjgtZTc0ZGIxMDE4ZGYwXkEyXkFqcGc@._V1_SX300.jpg	155	1160419	PG-13	драматичный
Ip Man	Ip Man	Ип Ман	2008-12-12	https://m.media-amazon.com/images/M/MV5BZmJjZDE0MmYtNzgwYy00NTg2LWE0NDYtNzA0YTA4MjA0NmYxXkEyXkFqcGc@._V1_SX300.jpg	106	1220719	R	драматичный
Hot Tub Time Machine	Hot Tub Time Machine	Машина времени в гидромассажной ванне	2010-03-26	https://m.media-amazon.com/images/M/MV5BMTQwMjExODA4Ml5BMl5BanBnXkFtZTcwNTYwMDYxMw@@._V1_SX300.jpg	99	1231587	R	комедийный
21 Jump Street	21 Jump Street	Джамп Стрит, 21	2012-03-16	https://m.media-amazon.com/images/M/MV5BMTg2NjJiODctM2IyMS00MmQ5LWI1YmQtNTBjMTI4M2U2YzA5XkEyXkFqcGc@._V1_SX300.jpg	109	1232829	R	комедийный
RoboCop	RoboCop	Робокоп	2014-02-12	https://m.media-amazon.com/images/M/MV5BMjAyOTUzMTcxN15BMl5BanBnXkFtZTgwMjkyOTc1MDE@._V1_SX300.jpg	117	1234721	PG-13	экшн
A Prophet	A Prophet	Пророк	2010-03-26	https://m.media-amazon.com/images/M/MV5BMTUyMjQ1MTY5OV5BMl5BanBnXkFtZTcwNzY5NjExMw@@._V1_SX300.jpg	155	1235166	R	драматичный
Death Note	Death Note	Смертная записка	2017-08-25	https://m.media-amazon.com/images/M/MV5BMTUwOTgzMTEyOF5BMl5BanBnXkFtZTgwNTk3MTM5MjI@._V1_SX300.jpg	101	1241317	TV-MA	драматичный
Amsterdam	Amsterdam	Амстердам	2022-10-07	https://m.media-amazon.com/images/M/MV5BNzgxNTQzYTEtMDI3Yi00OGQ1LWFkNGMtZDEyM2JlYmE0YzUyXkEyXkFqcGc@._V1_SX300.jpg	134	10304142	R	драматичный
Don't Worry Darling	Don't Worry Darling	Не волнуйся, дорогая	2022-09-23	https://m.media-amazon.com/images/M/MV5BY2I0ZDExM2EtZTQ4OC00NGQ0LWIzYjktYWE4MDMxZDZlY2MwXkEyXkFqcGc@._V1_SX300.jpg	123	10731256	R	драматичный
Drive My Car	Drive My Car	Управляй моей машиной	2021-08-20	https://m.media-amazon.com/images/M/MV5BOGE5ZWRhYjYtNzVkMS00ZGU3LTg2MTMtODYyMmJlMDMyZjU0XkEyXkFqcGc@._V1_SX300.jpg	179	14039582	R	драматичный
Sweet Girl	Sweet Girl	Милая девочка	2021-08-20	https://m.media-amazon.com/images/M/MV5BMmJhZjEzNWEtODdiOC00ZTA2LWE1YmEtMDYxZWI2ZWVkOWVkXkEyXkFqcGc@._V1_SX300.jpg	110	10731768	R	драматичный
The Bad Guys: The Movie	The Bad Guys: The Movie	Плохие парни: Фильм	2019-09-20	https://m.media-amazon.com/images/M/MV5BMWFjODhiMmEtZDIyYi00MzFhLWE4NGEtMTg3ODEwZDQyMzhhXkEyXkFqcGc@._V1_SX300.jpg	114	10726604	Not Rated	экшн
Demon Slayer: Kimetsu no Yaiba - The Movie: Mugen Train	Demon Slayer: Kimetsu no Yaiba - The Movie: Mugen Train	Убийца демонов: Кимэцу но Яиба - Фильм: Поезд Муген	2021-04-23	https://m.media-amazon.com/images/M/MV5BNzEzYjhkYTctMWNmZS00MTc5LWI4OWUtZjFkNzNkYTNkMTJlXkEyXkFqcGc@._V1_SX300.jpg	117	11032374	R	экшн
The Northman	The Northman	Северянин	2022-04-22	https://m.media-amazon.com/images/M/MV5BYzgwM2JiY2MtNWQ5OC00NDc1LWExMjYtYmY2YjViZmViYWM5XkEyXkFqcGc@._V1_SX300.jpg	137	11138512	R	драматичный
House of Gucci	House of Gucci	Дом Гуччи	2021-11-24	https://m.media-amazon.com/images/M/MV5BMmQ3OTRiYWItMGRiOC00ZTVmLWJjMjEtNjZhNDQ5NjIxODNjXkEyXkFqcGc@._V1_SX300.jpg	158	11214590	R	драматичный
Horse Girl	Horse Girl	Девушка-Лошадь	2020-02-07	https://m.media-amazon.com/images/M/MV5BMmZmODVkNzQtYzkwMC00ODkxLTk1MTgtMTBmYmFiYWMzYWQzXkEyXkFqcGc@._V1_SX300.jpg	103	11388406	R	драматичный
Jackass Forever	Jackass Forever	Чудаки навсегда	2022-02-04	https://m.media-amazon.com/images/M/MV5BYjljZTI4NTgtYTc4NS00MWM0LThkNDUtNjZkNjE4ZjNhODU1XkEyXkFqcGc@._V1_SX300.jpg	96	11466222	R	комедийный
The Man from Toronto	The Man from Toronto	Человек из Торонто	2022-06-24	https://m.media-amazon.com/images/M/MV5BMzhlZTZjZDItNzFhYi00MmM3LWFlNTEtNjVlOWM2NmMyMGU5XkEyXkFqcGc@._V1_SX300.jpg	110	11671006	PG-13	комедийный
Prey	Prey	Добыча	2022-08-05	https://m.media-amazon.com/images/M/MV5BMWVjYTBlYjktODhjZS00OTUyLTg4MzctODI4MTkyNDE5YzY0XkEyXkFqcGc@._V1_SX300.jpg	100	11866324	R	экшн
Watcher	Watcher	наблюдатель	2022-06-03	https://m.media-amazon.com/images/M/MV5BOGU3ZjhhNjYtNTk3MS00ZDM3LWE1MjQtZDNmNTIzNjhmZDFkXkEyXkFqcGc@._V1_SX300.jpg	96	12004038	R	драматичный
First Man	First Man	Первый человек	2018-10-12	https://m.media-amazon.com/images/M/MV5BYmIzYmViN2UtMDRhYy00OTMwLWI5YzctMTQxYzg2ODMwMTIwXkEyXkFqcGc@._V1_SX300.jpg	141	1213641	PG-13	драматичный
Brave	Brave	Храбрый	2012-06-22	https://m.media-amazon.com/images/M/MV5BMzgwODk3ODA1NF5BMl5BanBnXkFtZTcwNjU3NjQ0Nw@@._V1_SX300.jpg	93	1217209	PG	экшн
Sonic the Hedgehog 2	Sonic the Hedgehog 2	Ежик Соник 2	2022-04-08	https://m.media-amazon.com/images/M/MV5BMDBiYzk0YTMtNWRiYi00YWY0LWE3NjgtYmJiYTAwZmYzOTM0XkEyXkFqcGc@._V1_SX300.jpg	122	12412888	PG	комедийный
Parallel Mothers	Parallel Mothers	Параллельные матери	2021-10-08	https://m.media-amazon.com/images/M/MV5BZTE3MTU4ZjYtZDU3Yi00NTk3LWJkMzAtMTU4ZjY3NGJjZmQ1XkEyXkFqcGc@._V1_SX300.jpg	123	12618926	R	драматичный
Luca	Luca	Лука	2021-06-18	https://m.media-amazon.com/images/M/MV5BMWMyNGNlZTktODVkNS00ZmMyLTk0NmUtNWVjOWU1MWMzZGMzXkEyXkFqcGc@._V1_SX300.jpg	95	12801262	PG	комедийный
The Exorcist: Believer	The Exorcist: Believer	Экзорцист: Верующий	2023-10-06	https://m.media-amazon.com/images/M/MV5BYjMxN2E4NTctYjYxZi00OTM5LTk3YTAtZmI0MjljN2VhNmY5XkEyXkFqcGc@._V1_SX300.jpg	111	12921446	R	страшный
Indiana Jones and the Dial of Destiny	Indiana Jones and the Dial of Destiny	Индиана Джонс и циферблат судьбы	2023-06-30	https://m.media-amazon.com/images/M/MV5BYWJlOWE2ZjEtZGRhOC00M2YzLWFkZGEtYzIzZWI2Zjg3NWYxXkEyXkFqcGc@._V1_SX300.jpg	154	1462764	PG-13	экшн
The Greatest Showman	The Greatest Showman	Величайший шоумен	2017-12-20	https://m.media-amazon.com/images/M/MV5BMjI1NDYzNzY2Ml5BMl5BanBnXkFtZTgwODQwODczNTM@._V1_SX300.jpg	105	1485796	PG	драматичный
The Tinder Swindler	The Tinder Swindler	Мошенник из Тиндера	2022-02-02	https://m.media-amazon.com/images/M/MV5BNTQ5YzM2YzQtNGY0ZS00ZjUyLThmN2YtYzlmNTEzMmQ0YzgyXkEyXkFqcGc@._V1_SX300.jpg	114	14992922	TV-MA	детективный
Halloween	Halloween	Хэллоуин	2018-10-19	https://m.media-amazon.com/images/M/MV5BY2FlMzdkZTMtN2MwOS00NjQzLTlkMGYtMTRiYWUxZjM2M2ZiXkEyXkFqcGc@._V1_SX300.jpg	106	1502407	R	драматичный
Barbie	Barbie	Барби	2023-07-21	https://m.media-amazon.com/images/M/MV5BYjI3NDU0ZGYtYjA2YS00Y2RlLTgwZDAtYTE2YTM5ZjE1M2JlXkEyXkFqcGc@._V1_SX300.jpg	114	1517268	PG-13	комедийный
Murder Mystery	Murder Mystery	Тайное убийство	2019-06-14	https://m.media-amazon.com/images/M/MV5BMzg4NDFjNmYtZjQxMy00MDY4LWEyZjUtYzRjNjNkNjJiZTZhXkEyXkFqcGc@._V1_SX300.jpg	97	1618434	PG-13	романтический
Ted	Ted	Тед	2012-06-29	https://m.media-amazon.com/images/M/MV5BMTQ1OTU0ODcxMV5BMl5BanBnXkFtZTcwOTMxNTUwOA@@._V1_SX300.jpg	106	1637725	R	комедийный
Super 8	Super 8	Супер 8	2011-06-10	https://m.media-amazon.com/images/M/MV5BMjIzNjEyMzcwOF5BMl5BanBnXkFtZTcwMTkyMjE0NQ@@._V1_SX300.jpg	112	1650062	PG-13	экшн
Despicable Me 2	Despicable Me 2	Гадкий я 2	2013-07-03	https://m.media-amazon.com/images/M/MV5BMTQxNzY1MjI5NF5BMl5BanBnXkFtZTcwNTI0MDY1OQ@@._V1_SX300.jpg	98	1690953	PG	комедийный
The Spectacular Now	The Spectacular Now	Зрелищное сейчас	2013-09-13	https://m.media-amazon.com/images/M/MV5BMjA5MTc0NTkzM15BMl5BanBnXkFtZTcwODEwNjE3OQ@@._V1_SX300.jpg	95	1714206	R	драматичный
Top Gun: Maverick	Top Gun: Maverick	Лучший стрелок: Маверик	2022-05-27	https://m.media-amazon.com/images/M/MV5BMDBkZDNjMWEtOTdmMi00NmExLTg5MmMtNTFlYTJlNWY5YTdmXkEyXkFqcGc@._V1_SX300.jpg	130	1745960	PG-13	драматичный
A Dog's Purpose	A Dog's Purpose	Цель собаки	2017-01-27	https://m.media-amazon.com/images/M/MV5BNDQ4NjkxNzgzN15BMl5BanBnXkFtZTgwMjAzODQ4OTE@._V1_SX300.jpg	100	1753383	PG	драматичный
The Amazing Bulk	The Amazing Bulk	Удивительная масса	2012-04-17	https://m.media-amazon.com/images/M/MV5BMTQ2OTYwMzQwNl5BMl5BanBnXkFtZTgwMzc1NjkyNDE@._V1_SX300.jpg	76	1788453	Not Rated	комедийный
DJ Mau Mau: Space Funk	DJ Mau Mau: Space Funk	DJ Мау-Мау: космический фанк	2004-04-10	N/A	3	1814861	N/A	неизвестно
The Highwaymen	The Highwaymen	Разбойники	2019-03-29	https://m.media-amazon.com/images/M/MV5BYjIyNzBjNDktYjhlZS00MDk5LTg3OTctNDkwMTFlNmJhN2FlXkEyXkFqcGc@._V1_SX300.jpg	132	1860242	R	драматичный
Zeroville	Zeroville	Зеровилль	2019-09-27	https://m.media-amazon.com/images/M/MV5BODViNWI4ZDctMzNlZC00MmMwLWIyMWMtNTlmMjAyMzUwZjk0XkEyXkFqcGc@._V1_SX300.jpg	96	1881109	R	драматичный
Brimstone	Brimstone	Сера	2017-01-12	https://m.media-amazon.com/images/M/MV5BMzg2YjRhODMtYTMwNi00YjFiLTk2ZjgtYjRlOWVkOTA3M2Y0XkEyXkFqcGc@._V1_SX300.jpg	148	1895315	R	драматичный
Penguins of Madagascar	Penguins of Madagascar	Пингвины Мадагаскара	2014-11-26	https://m.media-amazon.com/images/M/MV5BMTEyMDg4MDU4MjdeQTJeQWpwZ15BbWU4MDQyOTc3MjIx._V1_SX300.jpg	92	1911658	PG	экшн
Sinister	Sinister	Зловещий	2012-10-12	https://m.media-amazon.com/images/M/MV5BMjI5MTg1Njg0Ml5BMl5BanBnXkFtZTcwNzg2Mjc4Nw@@._V1_SX300.jpg	110	1922777	R	экшн
A Christmas Carol	A Christmas Carol	Рождественский гимн	2009-11-06	https://m.media-amazon.com/images/M/MV5BMTM1MTI5ODU4MV5BMl5BanBnXkFtZTcwNTYyNTU4Mg@@._V1_SX300.jpg	96	1067106	PG	комедийный
\.


--
-- TOC entry 4924 (class 0 OID 16433)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_user, nickname, password, role, prof_pic_link) FROM stdin;
2	f1r0	123	admin	\N
4	user7	123	admin	
6	f1ro	123	user	
8	user8	123	user	
9	user10	123	admin	
10	use11	hgfhfhfhghf	user	
\.


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 229
-- Name: acting_id_acting_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.acting_id_acting_seq', 1111, true);


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 228
-- Name: actors_id_actor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actors_id_actor_seq', 841, true);


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 230
-- Name: directing_id_directing_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directing_id_directing_seq', 346, true);


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 231
-- Name: directors_id_director_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_id_director_seq', 256, true);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 233
-- Name: favourite_movies_id_favourite_movies_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favourite_movies_id_favourite_movies_seq', 6, true);


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 226
-- Name: genre_movies_id_genre_movies_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_movies_id_genre_movies_seq', 897, true);


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 224
-- Name: genres_id_genre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_id_genre_seq', 24, true);


--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 234
-- Name: movies_id_movie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_id_movie_seq', 2, true);


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 232
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_user_seq', 10, true);


--
-- TOC entry 4759 (class 2606 OID 16546)
-- Name: acting acting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acting
    ADD CONSTRAINT acting_pkey PRIMARY KEY (id_acting);


--
-- TOC entry 4753 (class 2606 OID 16548)
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (id_actor);


--
-- TOC entry 4755 (class 2606 OID 16530)
-- Name: directing directing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directing
    ADD CONSTRAINT directing_pkey PRIMARY KEY (id_directing);


--
-- TOC entry 4751 (class 2606 OID 16486)
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id_director);


--
-- TOC entry 4747 (class 2606 OID 16460)
-- Name: favourite_movies favourite_movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourite_movies
    ADD CONSTRAINT favourite_movies_pkey PRIMARY KEY (id_favourite_movies);


--
-- TOC entry 4770 (class 2606 OID 16586)
-- Name: genre_movies genre_movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_movies
    ADD CONSTRAINT genre_movies_pkey PRIMARY KEY (id_genre_movies);


--
-- TOC entry 4763 (class 2606 OID 16577)
-- Name: genres genres_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_name_key UNIQUE (name);


--
-- TOC entry 4765 (class 2606 OID 16579)
-- Name: genres genres_name_ru_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_name_ru_key UNIQUE (name_ru);


--
-- TOC entry 4767 (class 2606 OID 16575)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id_genre);


--
-- TOC entry 4745 (class 2606 OID 16462)
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id_movie);


--
-- TOC entry 4743 (class 2606 OID 16439)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- TOC entry 4756 (class 1259 OID 16668)
-- Name: fki_M; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_M" ON public.directing USING btree (id_movie);


--
-- TOC entry 4760 (class 1259 OID 16554)
-- Name: fki_actors; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_actors ON public.acting USING btree (id_actor);


--
-- TOC entry 4757 (class 1259 OID 16541)
-- Name: fki_director; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_director ON public.directing USING btree (id_director);


--
-- TOC entry 4768 (class 1259 OID 16689)
-- Name: fki_genres; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_genres ON public.genre_movies USING btree (id_genre);


--
-- TOC entry 4761 (class 1259 OID 16657)
-- Name: fki_movie; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_movie ON public.acting USING btree (id_movie);


--
-- TOC entry 4748 (class 1259 OID 16468)
-- Name: fki_movies; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_movies ON public.favourite_movies USING btree (id_movie);


--
-- TOC entry 4749 (class 1259 OID 16479)
-- Name: fki_users; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_users ON public.favourite_movies USING btree (id_user);


--
-- TOC entry 4775 (class 2606 OID 16647)
-- Name: acting actors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acting
    ADD CONSTRAINT actors FOREIGN KEY (id_actor) REFERENCES public.actors(id_actor) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4773 (class 2606 OID 16658)
-- Name: directing director; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directing
    ADD CONSTRAINT director FOREIGN KEY (id_director) REFERENCES public.directors(id_director) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4777 (class 2606 OID 16684)
-- Name: genre_movies genres; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_movies
    ADD CONSTRAINT genres FOREIGN KEY (id_genre) REFERENCES public.genres(id_genre) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4776 (class 2606 OID 16652)
-- Name: acting movie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acting
    ADD CONSTRAINT movie FOREIGN KEY (id_movie) REFERENCES public.movies(id_movie) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4774 (class 2606 OID 16663)
-- Name: directing movie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directing
    ADD CONSTRAINT movie FOREIGN KEY (id_movie) REFERENCES public.movies(id_movie) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4771 (class 2606 OID 16669)
-- Name: favourite_movies movies; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourite_movies
    ADD CONSTRAINT movies FOREIGN KEY (id_movie) REFERENCES public.movies(id_movie) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4778 (class 2606 OID 16679)
-- Name: genre_movies movies; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_movies
    ADD CONSTRAINT movies FOREIGN KEY (id_movie) REFERENCES public.movies(id_movie) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4772 (class 2606 OID 16674)
-- Name: favourite_movies users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourite_movies
    ADD CONSTRAINT users FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2025-12-13 10:12:32

--
-- PostgreSQL database dump complete
--

\unrestrict qBHgHXSdCpsUqRjEmcTbc1rtsyDwIf7LGFT2rBVMEkfMJraJkTBX01VLWugx15t

