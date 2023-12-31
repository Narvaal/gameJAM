extends Control

@onready var player = get_node("/root/AlanScenen/Player")
@onready var prompt = get_node("SubViewportContainer/SubViewport/MarginContainer/PanelContainer/VSplitContainer/ColorRect/RichTextLabel")
@onready var sub_container = get_node("SubViewportContainer")
@onready var input = get_node("SubViewportContainer/SubViewport/MarginContainer/PanelContainer/VSplitContainer/ColorRect2/LineEdit")
@onready var computer_colision = get_node("/root/AlanScenen/Room/computer/computer_screen_middle/screen_body")

var input_list: Array[String]
var auto_complete: Array[String] = ["arquivos","menu","clear","valores.txt"]
var cont = 0
var find_index = 0

var finalizado = false
var respondendo = false
var perguntas_1: Array[String] = ["M23 aparentemente possui um dinosauro de comportamento estranho. Identifique a espécie!","Algumas capturas decteram movimentos rapidos, identifique a espécie!","Dinossauros velozes foram identificado. informe quantos foram capturados!","Existem algumas especies bastante hostis capturadas pela R23. Identifique-os!","L12 captorou imagens de um dinossauro aparentemente robusto. Idenfique-o!","Algum dinosauro teve comportamenteo estranho?","Parece que um ser não catalogado foi capturado, fique atento!"]
var respostas_1 = []
var respostas_corretas = ["8953","1567","2","15672529","9845","0002","0003"]

# Called when the node enters the scene tree for the first time.
func _ready():
	input.grab_focus()

	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	prompt.text += get_menu()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	input.grab_focus()
		
	if Input.is_action_just_pressed("ui_focus_next"):
		if input.text != "":
			find_index = auto_complete.find(input.text.to_lower(),0)
			if find_index != -1:
				input.text = auto_complete[find_index]
			
			
	if Input.is_action_just_pressed("ui_text_submit"):
		if input.text != "":
			prompt.text += "[color=green]676584@2131:[color=white]"+input.text + "\n"
			match input.text.to_lower():
				"menu":
					prompt.text += get_menu()
				"arquivos":
					prompt.text += get_arquivos()
				"clear":
					prompt.text = ""
				"valores.txt":
					prompt.text += get_arquivo1()
				"exp-667988.txt":
					prompt.text += get_arquivo2()
				"exp-676584.txt":
					prompt.text += get_arquivo3()
				"relatorios":
					prompt.text += get_relatorios()
				"rlt-1.txt":
					prompt.text += get_quest1()
				"enviar":
					prompt.text += get_score()
				"back":
					prompt.text += back()
					prompt.text += get_relatorios()
				"glossario":
					prompt.text += get_glossario()
				"help":
					prompt.text += help()
				"sair":
					player.can_look_around = true
					self.visible = false
					computer_colision.collision_layer = player.collision_layer
					
					player.can_move = true
				_:
					if respondendo and input.text != "back":
						prompt.text += "Respostas Salvas"
						get_answer(input.text)
					else:
						prompt.text += "[color=red]Não foi possivel encontrar o comando {" + input.text +"}\n"
						
			input_list.append(input.text)
			input.clear()	

func get_menu():
	return get_logo() + "[color=white]-->Menu
 -Relatórios
 -Enviar              
 -Glossario                
 -Arquivos                 
 -Sair                   
"
	return ""

func get_arquivos():
	return "[color=white]-->Arquivos
Nome					Data					Acessivel
valores.txt			01/06/1967			*
exp-667988.txt		01/06/1967			*
exp-676584.txt		02/06/1971			*
"

func get_logo():
	return " [color=white]                                                                                   
  _/      _/    _/_/_/        _/_/_/      _/_/_/   
 _/      _/      _/        _/              _/      
_/      _/      _/          _/_/          _/       
 _/  _/        _/              _/        _/        
  _/    _/  _/_/_/  _/  _/_/_/    _/  _/_/_/ 
   *          *     *    **    *  *      * 
   * *    *  *  * * * *     *  * **     *    
	   *    * *    *   *     **     * **
			  *  *              *                  
"

func get_arquivo1():
	return "[color=white]
>>>	Nome Documento[valores]	Data Criação[01/06/1967]
	
	Inaugurada no apogeu de 1937, a V.I.S.I. emergiu como um farol cintilante de inovação em uma época marcada por descobertas sem precedentes. Nutrida por experimentações teóricas audaciosas que desafiavam as concepções convencionais da realidade, esta entidade foi impelida por um anseio profundo de entrelaçar conceitos vanguardistas à prática científica. Desde seus primórdios, revelou-se destemida na exploração da confluência entre a física quântica e as ciências biológicas, trilhando caminhos que poucos ousariam sonhar.
Nos albores de sua existência, a corporação ganhou notoriedade por suas proposições teóricas vanguardistas, delineando experimentações na vanguarda do saber científico. Tais iniciativas, embora veladas sob um manto de mistério, evidenciaram uma tenacidade em questionar e transmutar as fronteiras do factível e do imaginário. As ideias abraçadas naquele tempo pareciam emanar mais do âmbito da ficção científica do que da investigação empírica, pavimentando a via para um novo paradigma experimental.
Central a essas inquisições era a convicção de que, por meio de experimentos tanto audaciosos quanto inovadores, seria possível desvendar percepções profundas acerca da essência da realidade e da existência. V.I.S.I., mais que uma mera instituição corporativa, consolidou-se como uma incubadora de mentes luminares, arquitetando o futuro. Em seus laboratórios de ponta, uma sinfonia de cientistas e engenheiros, movidos por uma paixão inexorável pela descoberta, labora em uníssono.
Essa jornada incessante em prol do progresso encaminhou a V.I.S.I. para a exploração de horizontes inéditos, frequentemente transgredindo os limites do concebível. Por detrás dos umbrais de seus recintos labirínticos, a instituição cultiva a filosofia de que nenhum tributo é demasiado elevado para a ascensão do conhecimento. Na senda para reconfigurar os contornos do possível, adotou-se uma metodologia sem restrições, onde cada experimento se revela como um portal para um amanhã inexplorado. Com uma dedicação irrefutável à obtenção de resultados e eficiência, a V.I.S.I. almeja imprimir uma marca indelével na tapeçaria do mundo, desafiando os obstáculos e os sacrifícios que tal missão possa exigir.
"
	
	
func get_arquivo2():
	return "[color=white]
>>>	Nome Documento[Experimento-698969]	Data Criação[02/06/1971]

	Andrew Smith, o renomado cientista chefe do departamento de física quântica, liderou a vanguarda da pesquisa no experimento 667988 em 16 de outubro de 1937. O projeto audacioso tinha como premissa a possibilidade de estabelecer uma conexão entre dois corpos distintos através do fenômeno de emaranhamento quântico. Com determinação, Andrew empreendeu esforços incansáveis para sincronizar as vibrações de dois pontos distintos no universo.
A hipótese inicial de Andrew girava em torno do emaranhamento atômico de quarks, com a expectativa de que tal mecanismo permitiria a transferência de informação entre dois pontos separados. Apesar dos desafios e do ceticismo generalizado, Andrew não se deixou desanimar pela ausência de resultados imediatos.
Inspirado pelos estudos iniciais de Albert Einstein em física quântica, que começaram em 1972, Andrew decidiu levar adiante a teoria que permanece apenas no papel até então. Empunhando seu vasto conhecimento, ele deu início ao experimento 667988. Este projeto pioneiro envolvia o teletransporte quântico, uma técnica que permite transferir dados de um sistema quântico, como um íon, para outro, mesmo que estes estejam completamente isolados um do outro.
Andrew inovou ao aplicar uma técnica recentemente desenvolvida, fundamentada nos princípios do acoplamento de troca de Heisenberg. Essa abordagem revelou que, quando várias partículas possuem o mesmo momento magnético, elas não podem coexistir no mesmo espaço ao mesmo tempo devido a um fenômeno conhecido como superposição. Isso significa que dois elétrons no mesmo estado quântico não podem ser superpostos, pois seus estados alternavam no tempo.
Em 21 de maio de 1944 o experimento culminou com um feito extraordinário: Andrew conseguiu teletransportar informação entre dois locais distintos. Esse ato de teletransporte quântico exemplificou o que Einstein descreveu como 'ação fantasmagórica à distância'.
Contudo, Andrew sempre viu Einstein sob uma luz diferente. Enquanto reconhecia sua genialidade, Andrew considerava Einstein excessivamente cauteloso, quase como uma criança receosa, temerosa de se aventurar para além do familiar. Esta percepção o motivou a ultrapassar os limites que Einstein hesitava em cruzar.
Com sua conquista, Andrew não apenas confirmou a viabilidade do teletransporte quântico, mas também redefiniu as fronteiras do conhecimento humano, alterando para sempre o curso do mundo científico.
"	

func get_arquivo3():
	return"[color=white]
>>>	Nome Documento[Experimento-667988]	Data Criação[02/04/1973]

	James Hust, nosso engenheiro e químico de renome, enfrentou o desafio monumental de construir um ambiente totalmente isolado, essencial para a ocorrência de sobreposição quântica. O objetivo era criar um habitat que permitisse a um átomo existir simultaneamente em dois estados diferentes.
O marco inicial dos experimentos de J. Hust foi registrado em 19 de fevereiro de 1945. Seu primeiro passo consistiu na elaboração de uma câmara especial, projetada para imobilizar um átomo em constante movimento. Esta caixa, construída com uma fundação rígida e fortificada, garantia que o átomo permanecesse estático, imune às influências externas, mas que continuasse realizando o seu giro. A estabilização do átomo nesta câmara marcou o primeiro sucesso de seu experimento.
Avançando em sua pesquisa, J. Hust concentrou-se em desenvolver um método para a destruição controlada do átomo. Sua solução inovadora envolveu a integração de uma ogiva de urânio-238 acoplada a um detonador com uma probabilidade equilibrada de ativação. Para garantir a precisão dessa probabilidade, J. Hust buscou inspiração nos padrões estatísticos de nascimentos. Ele projetou o detonador para espelhar as probabilidades do sexo dos bebês nascidos no Hospial Ronald Reagan na Califórnia durante o mês de abril.
Depois de dois anos intensos de pesquisa e experimentação, J. Hust alcançou uma correspondência perfeita com os padrões de nascimento, prevendo corretamente o sexo de todos os 314 bebês nascidos naquele mês. O êxito desse experimento foi marcado pela euforia de J. Hust, que proclamou sua conquista com grande entusiasmo.
Com esses avanços, J. Hust não apenas alcançou um marco significativo na física quântica, mas também redefiniu as possibilidades científicas, mudando o mundo com sua genialidade e perseverança.
"	

func get_arquivo4():
	return"[color=white]
>>>	Nome Documento[Experimento-676584]	Data Criação[02/04/1973]

Ficha Completa
Nome: Alexandre Khalst
Gênero: Masculino
Nacionalidade: Austríaco
Idade: 32 anos
Tipo Sanguíneo: AB+
Cor dos Olhos: Castanho Escuro
Altura: 1,80 m
Peso: 78 kg
Estado Civil: Solteiro
Profissão: Professor de Biologia em uma escola pequena na Áustria
Personalidade: Quieto, Reservado, Inteligente, Obcecado e Corajoso
Pessoas que o Conhecem:
Família: Johann Khalst (Pai), Marianne Khalst (Mãe, falecida).
Alunos: Emma Weber, Felix Gruber, Sophie Hofer, Maximilian Bauer, Sarah Huber, Lukas Wagner, Anna Schmidt, David Müller, Leonie Fischer, Jonas Schneider, Mia Schwarz, Elias Pichler, Lara Lang.
Colegas de Trabalho: Martina Steiner, Thomas Berger, Julia Wagner.
Observação Sobre o Experimento: Dada a natureza discreta de Alexandre e a limitada extensão de seu círculo social, eliminar todas as pessoas que o conhecem seria relativamente simples, o que o torna um candidato perfeito para o experimento. Os métodos de eliminação poderiam variar, dependendo da situação de cada indivíduo. Para sua família e colegas de trabalho, métodos discretos como envenenamento ou 'acidentes' domésticos poderiam ser empregados, enquanto para os alunos, medidas mais indiretas, como falsificação de registros ou criação de cenários de transferência para outras escolas, seriam adequadas. Essas estratégias garantiriam que qualquer rastro da existência de Alexandre fosse eficientemente apagado, permitindo a realização do experimento com o mínimo de interrupções ou suspeitas.
"

func get_relatorios():
	return "Nome					Data					Acessivel
rlt-1.txt		01/06/1967			*
"


func get_answer(value:String):
	if value != null:
		respostas_1 = value.split(" ", false, 100)
		respondendo = false

func get_help_quests():
	return "O usuario deve responder cada pergunta serpara por um espaço em branco, \n  as perguntas e as respostas está codificadas, use o glossario  \n\n"

func get_quest1():
	var main = get_help_quests()
	for i in range(perguntas_1.size()):
		if respostas_1.size() > i:
			main += "-" + perguntas_1[i] + " :  "	+ respostas_1[i] + "\n"
		else:
			main += "-" + perguntas_1[i] + " : " + "\n"
			
	respondendo = true
	return get_comandos() + main

func get_comandos():
	return "Caso não queira refazer o relatorio escreva BACK para voltar \n\n"


func get_score():
	var pontos = 0
	if respostas_1.size() > 0:
		for i in range(perguntas_1.size()):
			if respostas_1[i] == respostas_corretas[i]:
				pontos += 4
		if pontos == 28:
			print("final real")
			get_tree
			get_tree().change_scene_to_file("res://scenes/finalsceene.tscn")
		finalizado = true
		return "Total " + str(pontos) + "/28"
	finalizado = false

	return "Responda o relatorio antes de enviar \n"

func back():
	return "Saiu do modo preenchimento + \n"


func help():
	return "[color=white]\n\n
Comandos: 
	Clear - Limpa a tela
	Back - Cancela modo preenhcer relatorio
	Sair - Sai do console
"

func get_glossario():
	return "[color=white]
--------------------------
- DINOSSAUROS -- CODIGO --
- Stegosaurus -- 8953   -- 
- Trex 	      -- 2529   --
- Triceratops -- 9845   --
- Velociraptor-- 1567   --
--------------------------
- Camera1 -- L12	--
- Camera2 -- L23	--
- Camera3 -- L34	--
--------------------------
- Camera1 -- M12	--
- Camera2 -- M23	--
--------------------------
- Camera1 -- R12	--
- Camera2 -- R23	--
--------------------------
- Sim --- 0001
- Não --- 0002
- Confirmado --- 0003
--------------------------
- Anomalia --- 65
--------------------------
2529 -- Bipede, braços curtos, carnivoro.
8953 -- Grandes placas ósseas das costas e do rabo.
9845 -- Grande força física, três chifres.
1567 -- Veloz, carnívoro bípede, pequeno.
--------------------------
"
