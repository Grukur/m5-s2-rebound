PGDMP     #    8                {            m5_s2_rebound    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16499    m5_s2_rebound    DATABASE     �   CREATE DATABASE m5_s2_rebound WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE m5_s2_rebound;
                postgres    false            �            1259    16501    clientes    TABLE     �   CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    ciudad character varying(50) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16500    clientes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.clientes_id_seq;
       public          postgres    false    215                       0    0    clientes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;
          public          postgres    false    214            �            1259    16547    detalle_producto    TABLE       CREATE TABLE public.detalle_producto (
    id_producto integer NOT NULL,
    id_factura_cliente integer NOT NULL,
    articulo character varying(50) NOT NULL,
    cantidad integer NOT NULL,
    CONSTRAINT detalle_producto_cantidad_check CHECK ((cantidad >= 0))
);
 $   DROP TABLE public.detalle_producto;
       public         heap    postgres    false            �            1259    16524    factura_cliente    TABLE     �   CREATE TABLE public.factura_cliente (
    id integer NOT NULL,
    fecha date NOT NULL,
    id_cliente integer NOT NULL,
    CONSTRAINT factura_cliente_id_cliente_check CHECK ((id_cliente >= 0))
);
 #   DROP TABLE public.factura_cliente;
       public         heap    postgres    false            �            1259    16523    factura_cliente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.factura_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.factura_cliente_id_seq;
       public          postgres    false    219                        0    0    factura_cliente_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.factura_cliente_id_seq OWNED BY public.factura_cliente.id;
          public          postgres    false    218            �            1259    16508    producto    TABLE     �   CREATE TABLE public.producto (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    precio integer NOT NULL,
    CONSTRAINT producto_precio_check CHECK ((precio >= 0))
);
    DROP TABLE public.producto;
       public         heap    postgres    false            �            1259    16507    producto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.producto_id_seq;
       public          postgres    false    217            !           0    0    producto_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;
          public          postgres    false    216            s           2604    16504    clientes id    DEFAULT     j   ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);
 :   ALTER TABLE public.clientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            u           2604    16527    factura_cliente id    DEFAULT     x   ALTER TABLE ONLY public.factura_cliente ALTER COLUMN id SET DEFAULT nextval('public.factura_cliente_id_seq'::regclass);
 A   ALTER TABLE public.factura_cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            t           2604    16511    producto id    DEFAULT     j   ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);
 :   ALTER TABLE public.producto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217                      0    16501    clientes 
   TABLE DATA                 public          postgres    false    215   �"                 0    16547    detalle_producto 
   TABLE DATA                 public          postgres    false    220   ^#                 0    16524    factura_cliente 
   TABLE DATA                 public          postgres    false    219   $                 0    16508    producto 
   TABLE DATA                 public          postgres    false    217   �$       "           0    0    clientes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.clientes_id_seq', 3, true);
          public          postgres    false    214            #           0    0    factura_cliente_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.factura_cliente_id_seq', 8, true);
          public          postgres    false    218            $           0    0    producto_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.producto_id_seq', 5, true);
          public          postgres    false    216            z           2606    16506    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    215            �           2606    16552 &   detalle_producto detalle_producto_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.detalle_producto
    ADD CONSTRAINT detalle_producto_pkey PRIMARY KEY (id_producto, id_factura_cliente);
 P   ALTER TABLE ONLY public.detalle_producto DROP CONSTRAINT detalle_producto_pkey;
       public            postgres    false    220    220            ~           2606    16530 $   factura_cliente factura_cliente_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.factura_cliente
    ADD CONSTRAINT factura_cliente_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.factura_cliente DROP CONSTRAINT factura_cliente_pkey;
       public            postgres    false    219            |           2606    16514    producto producto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public            postgres    false    217            �           2606    16558 9   detalle_producto detalle_producto_id_factura_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_producto
    ADD CONSTRAINT detalle_producto_id_factura_cliente_fkey FOREIGN KEY (id_factura_cliente) REFERENCES public.factura_cliente(id);
 c   ALTER TABLE ONLY public.detalle_producto DROP CONSTRAINT detalle_producto_id_factura_cliente_fkey;
       public          postgres    false    220    3198    219            �           2606    16553 2   detalle_producto detalle_producto_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_producto
    ADD CONSTRAINT detalle_producto_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id);
 \   ALTER TABLE ONLY public.detalle_producto DROP CONSTRAINT detalle_producto_id_producto_fkey;
       public          postgres    false    217    220    3196            �           2606    16531 /   factura_cliente factura_cliente_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura_cliente
    ADD CONSTRAINT factura_cliente_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);
 Y   ALTER TABLE ONLY public.factura_cliente DROP CONSTRAINT factura_cliente_id_cliente_fkey;
       public          postgres    false    215    3194    219               �   x��̱
�0 �=_q[[�::�hS�_���IH��7�t{�S�n_=��@\G�fg�ϴ@�V��H��բm`8�ޭ�z/��c��"�>3N�jNB�ZJt�4��EL���TO�)l�%xC�p��)��)N�         �   x����
�@�Oqw*LAj&�ja ��Z[�͝``�y���h���S�m�tP��F�T�oITJ��<��f�H�70p���{���F0��Hn�k9j#	)���r/[�vra#(d��Ǡ�;��$N�;6�¦{�i�:���f+�;4�up�sp��/��j��A�4�         s   x���v
Q���W((M��L�KKL.)-J�O��L�+IU��L�QHKM�H�Q�L�	k*�9���+h��(�����(jZsyRn�9���@s��c����@s���rq C�M�         �   x���v
Q���W((M��L�+(�O)M.�W��L�Q���M*J�Q((JM���Ts�	uV�0�QPJMQ�Q06մ��$�#�9����%�@��(2�hV@b��1�$J2�d4�"�r+�K��� h �pn�     