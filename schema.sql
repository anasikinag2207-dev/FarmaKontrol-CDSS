PRAGMA foreign_keys = ON;

CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    age INTEGER NOT NULL,
    gender TEXT NOT NULL,
    diagnosis TEXT NOT NULL
);

CREATE TABLE Drugs (
    drug_id INTEGER PRIMARY KEY AUTOINCREMENT,
    trade_name TEXT NOT NULL,
    inn_substance TEXT NOT NULL,
    pharm_group TEXT NOT NULL
);

CREATE TABLE Interactions (
    interaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
    substance_1 TEXT NOT NULL,
    substance_2 TEXT NOT NULL,
    severity TEXT NOT NULL,
    clinical_effect TEXT NOT NULL
);

CREATE TABLE Prescriptions (
    prescription_id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER NOT NULL,
    drug_id INTEGER NOT NULL,
    start_date TEXT NOT NULL,
    end_date TEXT NOT NULL,
    therapy_outcome TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (drug_id) REFERENCES Drugs(drug_id)
);

INSERT INTO Patients (full_name, age, gender, diagnosis) VALUES
('Иванов Сергей Петрович', 64, 'М', 'Ишемическая болезнь сердца, фибрилляция предсердий'),
('Смирнова Елена Викторовна', 45, 'Ж', 'Ревматоидный артрит'),
('Кузнецов Дмитрий Олегович', 32, 'М', 'Острый бронхит'),
('Морозова Анна Ивановна', 58, 'Ж', 'Артериальная гипертензия 2 ст.'),
('Волков Алексей Николаевич', 71, 'М', 'Сахарный диабет 2 типа');

INSERT INTO Drugs (trade_name, inn_substance, pharm_group) VALUES
('Аспирин Кардио', 'Ацетилсалициловая кислота', 'Антиагреганты / НПВС'),
('Варфарин Никомед', 'Варфарин', 'Антикоагулянты'),
('Нурофен', 'Ибупрофен', 'НПВС'),
('МИГ 400', 'Ибупрофен', 'НПВС'),
('Кеторол', 'Кеторолак', 'НПВС'),
('Эналаприл', 'Эналаприл', 'Ингибиторы АПФ'),
('Верошпирон', 'Спиронолактон', 'Калийсберегающие диуретики'),
('Амоксиклав', 'Амоксициллин + Клавулановая кислота', 'Антибиотики пенициллинового ряда'),
('Метформин', 'Метформин', 'Гипогликемические средства');

INSERT INTO Interactions (substance_1, substance_2, severity, clinical_effect) VALUES
('Ацетилсалициловая кислота', 'Варфарин', 'Высокий', 'Критическое повышение риска желудочно-кишечных и внутренних кровотечений'),
('Ибупрофен', 'Кеторолак', 'Высокий', 'Высокий риск образования язв ЖКТ и кровотечений из-за дублирования НПВС'),
('Ибупрофен', 'Ибупрофен', 'Высокий', 'Дублирование действующего вещества (передозировка НПВС)'),
('Эналаприл', 'Спиронолактон', 'Средний', 'Риск развития тяжелой гиперкалиемии (повышения калия в крови)'),
('Ацетилсалициловая кислота', 'Ибупрофен', 'Средний', 'Снижение антиагрегантного (защитного) эффекта аспирина');

INSERT INTO Prescriptions (patient_id, drug_id, start_date, end_date, therapy_outcome) VALUES
(1, 1, '2026-11-01', '2026-11-30', 'Улучшение'),
(2, 3, '2026-11-10', '2026-11-20', 'Улучшение'),
(3, 8, '2026-10-01', '2026-10-07', 'Улучшение'),
(4, 6, '2026-11-05', '2026-12-05', 'Побочный эффект'),
(5, 9, '2026-11-01', '2026-12-31', 'Улучшение');
